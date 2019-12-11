# Anatomy of a read()

what happens underneath a read syscall? I need to understand all the layers of the file system involved in the I/O process, so that I know which point I can hook with my BPF extensions


## Linux I/O path, high level

```

-----------------------

       userland
-----------------------

       VFS
-----------------------

       FS
-----------------------

      device driver
-----------------------
```



## The common file model

VFS abstraction, capable of representing every supported file system.

the following object types are part of the common file model:
- superblock object: stores information on a mounted file system
- inode objecgt: general information about a specific file
- file object: interaction between an open file and an active process
- dentry object: information about the linking of a directory entry


```
P1------------> File object-----------> dentry object(can be shared)
							|
P2------------> File object-----------> dentry object   |
						|	|
						|       |
						|	|
						v	v
					      Inode Object
						|
						|
						V
					Superblock object
						|
						|
						v
					    Disk file
```


The most frequently used dentry objects are kept in a dentry cache (in RAM) by the VFS, in order to improve performance

file objects are process-file specific, and they contain a f-op field with all supported file operations (looks like a good point to extend for storing ebpf extensions, in the hopefully near future

)
## general notes

once upon a time in the userland, someone triggered an open and read syscall

```
int open(pathname, flags)
int read(int fd, void buf, sizet count)
```


read is a syscall, so at this point we trap in the kernel to trigger the syscall
- http://man7.org/linux/man-pages/man2/intro.2.html
- http://man7.org/linux/man-pages/man2/syscalls.2.html
- http://man7.org/linux/man-pages/man2/syscall.2.html
- https://doc.lagout.org/operating%20system%20/linux/Understanding%20Linux%20Kernel.pdf


The system call handler, which has a structure similar to that of the other exception handlers, performs the following operations:
• Saves the contents of most registers in the Kernel Mode stack (this operation is common to all system calls and is coded in assembly language).
• Handles the system call by invoking a corresponding C function called the system call service routine.
• Exits from the handler


## the VFS

The name of the service routine associated with a syscall whatever is generally `sys_whatever()`, so in this case the service routine is:

`
sys_open()
sys_read()
`

the sys open function performs the following operations:
- reads pathname
- gets an unused fd
- sets permission and access flags
- opens dentry
- sets the appropriate f op operations in the inode fop
- invokes the open method found in the file operations
- returns file descriptor

now it is possible to perform read/write operations on the file, let's have a look at sys read
- get address of file from file descriptor
- check flags for permissions
- verify access paramenters
- invoke file-> fop -> read if it is defined, or or the file-> fop -> aio read
- return the number of bytes transfered


- read call ->
- sys_read service handler ->
- the file abstraction in the kernel contains a pointer f_op to the FS-specific functions
- read becomes file->f_op->read() underneath

## the real kernel calls

I used ftrace (more specifically, the comand line tool trace-cmd) to obtain a trace of the kernel path for a read syscall.
The trace for kernel 4.15 is in the traces folder under the name 415traceprint.

The trace is for the whole execution of the file, but I identified the relevant open-read-write calls.
- line 31301 (sys_openat)
- line 32726 (sys_read)
- line 34168 (sys_write)

```
read()

sys_read()
  vfs_read()
    rw_verify_area() //checking for permissione
      {...}
    __vfs(read)
      ext4_file_read_iter()
    __fsnotify_parent()
    fsnotify()

```

## searching for a hook point
I need to find a good point in the read path, in order to hook the bpf instrumentation. Ideally, I want the hook to:
- avoid the copy from kernel level buffer to user level buffer
- be independent of the file system. So either at VFS level of at Block Interface level

### vfs_read

not good, return the user-level buffer to the caller

```
ssize_t vfs_read(struct file *file, char __user *buf, size_t count, loff_t *pos)
{
	ssize_t ret;

	if (!(file->f_mode & FMODE_READ))
		return -EBADF;
	if (!(file->f_mode & FMODE_CAN_READ))
		return -EINVAL;
	if (unlikely(!access_ok(VERIFY_WRITE, buf, count)))
		return -EFAULT;

	ret = rw_verify_area(READ, file, pos, count);
	if (!ret) {
		if (count > MAX_RW_COUNT)
			count =  MAX_RW_COUNT;
		ret = __vfs_read(file, buf, count, pos);
		if (ret > 0) {
			fsnotify_access(file);
			add_rchar(current, ret);
		}
		inc_syscr(current);
	}

	return ret;
}
```

### _ _ vfs_read
Not good, same reason as before. Problem is that now in the next step I'll be going into the file system specific functions. AT this stage I think we're finding file fop read_iter, because the trace does not show a call to new_sync_read

https://elixir.bootlin.com/linux/v4.15/source/include/linux/fs.h#L1692

```
ssize_t __vfs_read(struct file *file, char __user *buf, size_t count,
		   loff_t *pos)
{
	if (file->f_op->read)
		return file->f_op->read(file, buf, count, pos);
	else if (file->f_op->read_iter)
		return new_sync_read(file, buf, count, pos);
	else
		return -EINVAL;
}

```

### ext4_file_read_iter
ext4 does not define a file->fop->read operation, and instead defines a read iter operation ( https://elixir.bootlin.com/linux/v4.15/source/fs/ext4/file.c#L476 ), so we're calling new_sync_read ( https://elixir.bootlin.com/linux/v4.15/source/fs/read_write.c#L390 ) although ftrace does not report it (why?) and instead shows directly a call to ext4_file_read_iter()

```
static ssize_t new_sync_read(struct file *filp, char __user *buf, size_t len, loff_t *ppos)
{
	struct iovec iov = { .iov_base = buf, .iov_len = len };
	struct kiocb kiocb;
	struct iov_iter iter;
	ssize_t ret;

	init_sync_kiocb(&kiocb, filp);
	kiocb.ki_pos = *ppos;
	iov_iter_init(&iter, READ, &iov, 1, len);

	ret = call_read_iter(filp, &kiocb, &iter);
	BUG_ON(ret == -EIOCBQUEUED);
	*ppos = kiocb.ki_pos;
	return ret;
}
```
and it calls the relevant fop

```
static inline ssize_t call_read_iter(struct file *file, struct kiocb *kio,
				     struct iov_iter *iter)
{
	return file->f_op->read_iter(kio, iter);
}
```
which is ext4_file_read_iter

```
static ssize_t ext4_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
{
	if (unlikely(ext4_forced_shutdown(EXT4_SB(file_inode(iocb->ki_filp)->i_sb))))
		return -EIO;

	if (!iov_iter_count(to))
		return 0; /* skip atime */

#ifdef CONFIG_FS_DAX
	if (IS_DAX(file_inode(iocb->ki_filp)))
		return ext4_dax_read_iter(iocb, to);
#endif
	return generic_file_read_iter(iocb, to);
}

```
