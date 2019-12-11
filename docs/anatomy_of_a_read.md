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

```c
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

```c
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

``` c
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


``` c
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


and it calls the relevant fop for ext4. Now the user buffer is .iov_base in the iov struct, which is in turn inside iov_iter iter 


```c
static inline ssize_t call_read_iter(struct file *file, struct kiocb *kio,
				     struct iov_iter *iter)
{
	return file->f_op->read_iter(kio, iter);
}
```


which is ext4_file_read_iter. iov_iter contains the destination buffer. kiocb is the kernel io control block




```c
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

### generic file read iter

https://elixir.bootlin.com/linux/v4.15/source/mm/filemap.c#L2315

```c

/**
 * generic_file_read_iter - generic filesystem read routine
 * @iocb:	kernel I/O control block
 * @iter:	destination for the data read
 *
 * This is the "read_iter()" routine for all filesystems
 * that can use the page cache directly.
 */
ssize_t
generic_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
{
	size_t count = iov_iter_count(iter);
	ssize_t retval = 0;

	if (!count)
		goto out; /* skip atime */

	if (iocb->ki_flags & IOCB_DIRECT) {
		struct file *file = iocb->ki_filp;
		struct address_space *mapping = file->f_mapping;
		struct inode *inode = mapping->host;
		loff_t size;

		size = i_size_read(inode);
		if (iocb->ki_flags & IOCB_NOWAIT) {
			if (filemap_range_has_page(mapping, iocb->ki_pos,
						   iocb->ki_pos + count - 1))
				return -EAGAIN;
		} else {
			retval = filemap_write_and_wait_range(mapping,
						iocb->ki_pos,
					        iocb->ki_pos + count - 1);
			if (retval < 0)
				goto out;
		}

		file_accessed(file);

		retval = mapping->a_ops->direct_IO(iocb, iter);
		if (retval >= 0) {
			iocb->ki_pos += retval;
			count -= retval;
		}
		iov_iter_revert(iter, count - iov_iter_count(iter));

		/*
		 * Btrfs can have a short DIO read if we encounter
		 * compressed extents, so if there was an error, or if
		 * we've already read everything we wanted to, or if
		 * there was a short read because we hit EOF, go ahead
		 * and return.  Otherwise fallthrough to buffered io for
		 * the rest of the read.  Buffered reads will not work for
		 * DAX files, so don't bother trying.
		 */
		if (retval < 0 || !count || iocb->ki_pos >= size ||
		    IS_DAX(inode))
			goto out;
	}

	retval = generic_file_buffered_read(iocb, iter, retval);
out:
	return retval;
}
EXPORT_SYMBOL(generic_file_read_iter);

```

### generic file buffered read
https://elixir.bootlin.com/linux/v4.15/source/mm/filemap.c#L2053 

```c

static ssize_t generic_file_buffered_read(struct kiocb *iocb,
		struct iov_iter *iter, ssize_t written)
{
	struct file *filp = iocb->ki_filp;
	struct address_space *mapping = filp->f_mapping;
	struct inode *inode = mapping->host;
	struct file_ra_state *ra = &filp->f_ra;
	loff_t *ppos = &iocb->ki_pos;
	pgoff_t index;
	pgoff_t last_index;
	pgoff_t prev_index;
	unsigned long offset;      /* offset into pagecache page */
	unsigned int prev_offset;
	int error = 0;

	if (unlikely(*ppos >= inode->i_sb->s_maxbytes))
		return 0;
	iov_iter_truncate(iter, inode->i_sb->s_maxbytes);

	index = *ppos >> PAGE_SHIFT;
	prev_index = ra->prev_pos >> PAGE_SHIFT;
	prev_offset = ra->prev_pos & (PAGE_SIZE-1);
	last_index = (*ppos + iter->count + PAGE_SIZE-1) >> PAGE_SHIFT;
	offset = *ppos & ~PAGE_MASK;

	for (;;) {
		struct page *page;
		pgoff_t end_index;
		loff_t isize;
		unsigned long nr, ret;

		cond_resched();
find_page:
		if (fatal_signal_pending(current)) {
			error = -EINTR;
			goto out;
		}

		page = find_get_page(mapping, index);
		if (!page) {
			if (iocb->ki_flags & IOCB_NOWAIT)
				goto would_block;
			page_cache_sync_readahead(mapping,
					ra, filp,
					index, last_index - index);
			page = find_get_page(mapping, index);
			if (unlikely(page == NULL))
				goto no_cached_page;
		}
		if (PageReadahead(page)) {
			page_cache_async_readahead(mapping,
					ra, filp, page,
					index, last_index - index);
		}
		if (!PageUptodate(page)) {
			if (iocb->ki_flags & IOCB_NOWAIT) {
				put_page(page);
				goto would_block;
			}

			/*
			 * See comment in do_read_cache_page on why
			 * wait_on_page_locked is used to avoid unnecessarily
			 * serialisations and why it's safe.
			 */
			error = wait_on_page_locked_killable(page);
			if (unlikely(error))
				goto readpage_error;
			if (PageUptodate(page))
				goto page_ok;

			if (inode->i_blkbits == PAGE_SHIFT ||
					!mapping->a_ops->is_partially_uptodate)
				goto page_not_up_to_date;
			/* pipes can't handle partially uptodate pages */
			if (unlikely(iter->type & ITER_PIPE))
				goto page_not_up_to_date;
			if (!trylock_page(page))
				goto page_not_up_to_date;
			/* Did it get truncated before we got the lock? */
			if (!page->mapping)
				goto page_not_up_to_date_locked;
			if (!mapping->a_ops->is_partially_uptodate(page,
							offset, iter->count))
				goto page_not_up_to_date_locked;
			unlock_page(page);
		}
page_ok:
		/*
		 * i_size must be checked after we know the page is Uptodate.
		 *
		 * Checking i_size after the check allows us to calculate
		 * the correct value for "nr", which means the zero-filled
		 * part of the page is not copied back to userspace (unless
		 * another truncate extends the file - this is desired though).
		 */

		isize = i_size_read(inode);
		end_index = (isize - 1) >> PAGE_SHIFT;
		if (unlikely(!isize || index > end_index)) {
			put_page(page);
			goto out;
		}

		/* nr is the maximum number of bytes to copy from this page */
		nr = PAGE_SIZE;
		if (index == end_index) {
			nr = ((isize - 1) & ~PAGE_MASK) + 1;
			if (nr <= offset) {
				put_page(page);
				goto out;
			}
		}
		nr = nr - offset;

		/* If users can be writing to this page using arbitrary
		 * virtual addresses, take care about potential aliasing
		 * before reading the page on the kernel side.
		 */
		if (mapping_writably_mapped(mapping))
			flush_dcache_page(page);

		/*
		 * When a sequential read accesses a page several times,
		 * only mark it as accessed the first time.
		 */
		if (prev_index != index || offset != prev_offset)
			mark_page_accessed(page);
		prev_index = index;

		/*
		 * Ok, we have the page, and it's up-to-date, so
		 * now we can copy it to user space...
		 */

		ret = copy_page_to_iter(page, offset, nr, iter);
		offset += ret;
		index += offset >> PAGE_SHIFT;
		offset &= ~PAGE_MASK;
		prev_offset = offset;

		put_page(page);
		written += ret;
		if (!iov_iter_count(iter))
			goto out;
		if (ret < nr) {
			error = -EFAULT;
			goto out;
		}
		continue;

page_not_up_to_date:
		/* Get exclusive access to the page ... */
		error = lock_page_killable(page);
		if (unlikely(error))
			goto readpage_error;

page_not_up_to_date_locked:
		/* Did it get truncated before we got the lock? */
		if (!page->mapping) {
			unlock_page(page);
			put_page(page);
			continue;
		}

		/* Did somebody else fill it already? */
		if (PageUptodate(page)) {
			unlock_page(page);
			goto page_ok;
		}

readpage:
		/*
		 * A previous I/O error may have been due to temporary
		 * failures, eg. multipath errors.
		 * PG_error will be set again if readpage fails.
		 */
		ClearPageError(page);
		/* Start the actual read. The read will unlock the page. */
		error = mapping->a_ops->readpage(filp, page);

		if (unlikely(error)) {
			if (error == AOP_TRUNCATED_PAGE) {
				put_page(page);
				error = 0;
				goto find_page;
			}
			goto readpage_error;
		}

		if (!PageUptodate(page)) {
			error = lock_page_killable(page);
			if (unlikely(error))
				goto readpage_error;
			if (!PageUptodate(page)) {
				if (page->mapping == NULL) {
					/*
					 * invalidate_mapping_pages got it
					 */
					unlock_page(page);
					put_page(page);
					goto find_page;
				}
				unlock_page(page);
				shrink_readahead_size_eio(filp, ra);
				error = -EIO;
				goto readpage_error;
			}
			unlock_page(page);
		}

		goto page_ok;

readpage_error:
		/* UHHUH! A synchronous read error occurred. Report it */
		put_page(page);
		goto out;

no_cached_page:
		/*
		 * Ok, it wasn't cached, so we need to create a new
		 * page..
		 */
		page = page_cache_alloc(mapping);
		if (!page) {
			error = -ENOMEM;
			goto out;
		}
		error = add_to_page_cache_lru(page, mapping, index,
				mapping_gfp_constraint(mapping, GFP_KERNEL));
		if (error) {
			put_page(page);
			if (error == -EEXIST) {
				error = 0;
				goto find_page;
			}
			goto out;
		}
		goto readpage;
	}

would_block:
	error = -EAGAIN;
out:
	ra->prev_pos = prev_index;
	ra->prev_pos <<= PAGE_SHIFT;
	ra->prev_pos |= prev_offset;

	*ppos = ((loff_t)index << PAGE_SHIFT) + offset;
	file_accessed(filp);
	return written ? written : error;
}


```

### copy page to iter
I think this is it! https://elixir.bootlin.com/linux/v4.15/source/mm/filemap.c#L2183 
we have the page and copy it to userspace with this function
https://elixir.bootlin.com/linux/v4.15/ident/copy_page_to_iter

https://elixir.bootlin.com/linux/v4.15/source/lib/iov_iter.c#L699

I do not know what is the i->type of the iov_iter, so I need to checl which function gets called between the options. copy_to_iter would be ideal



```c

size_t copy_page_to_iter(struct page *page, size_t offset, size_t bytes,
			 struct iov_iter *i)
{
	if (unlikely(!page_copy_sane(page, offset, bytes)))
		return 0;
	if (i->type & (ITER_BVEC|ITER_KVEC)) {
		void *kaddr = kmap_atomic(page);
		size_t wanted = copy_to_iter(kaddr + offset, bytes, i);
		kunmap_atomic(kaddr);
		return wanted;
	} else if (likely(!(i->type & ITER_PIPE)))
		return copy_page_to_iter_iovec(page, offset, bytes, i);
	else
		return copy_page_to_iter_pipe(page, offset, bytes, i);
}
EXPORT_SYMBOL(copy_page_to_iter);

```

### copy_to_iter
potentially nice 
https://elixir.bootlin.com/linux/v4.15/source/include/linux/uio.h#L101

```c
static __always_inline __must_check
size_t copy_to_iter(const void *addr, size_t bytes, struct iov_iter *i)
{
	if (unlikely(!check_copy_size(addr, bytes, true)))
		return 0;
	else
		return _copy_to_iter(addr, bytes, i);
}
```

### _copy_to_iter

I think this is a good point to hook the bpf code. On the entry point addr holds the kernel buffer address, I have the size in bytes and the return size in bytes. can change everythong and return only the result to the user.

One question is: is addr the addewss to the raw bytes to transfer, or is there kernel metadata I need to ignore?

The problem with hooking at this point is that 
- left track of filename looong ago, as well as file descriptor and all that. 
- I went through the file system, so in order to keep track of what is what I have to transport information across a specific file system layer?
- we wanted to have some notion of the data type in the file, is it even present at this level



https://elixir.bootlin.com/linux/v4.15/source/lib/iov_iter.c#L558

```c

size_t _copy_to_iter(const void *addr, size_t bytes, struct iov_iter *i)
{
	const char *from = addr;
	if (unlikely(i->type & ITER_PIPE))
		return copy_pipe_to_iter(addr, bytes, i);
	if (iter_is_iovec(i))
		might_fault();
	iterate_and_advance(i, bytes, v,
		copyout(v.iov_base, (from += v.iov_len) - v.iov_len, v.iov_len),
		memcpy_to_page(v.bv_page, v.bv_offset,
			       (from += v.bv_len) - v.bv_len, v.bv_len),
		memcpy(v.iov_base, (from += v.iov_len) - v.iov_len, v.iov_len)
	)

	return bytes;
}
EXPORT_SYMBOL(_copy_to_iter);

```

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


From this point on, this is just going deeper in the rabbit hole


### copyout

https://elixir.bootlin.com/linux/v4.15/source/lib/iov_iter.c#L133

I think this might be a good point, on entry point of the function I can modify the from buffer and the size, and only copy the answer to userland.

-> NO actually better to go one level up, because copyout gets called repeatedy until there is more to read, might be hard for consistency and seek point.
go one level up

```c
static int copyout(void __user *to, const void *from, size_t n)
{
	if (access_ok(VERIFY_WRITE, to, n)) {
		kasan_check_read(from, n);
		n = raw_copy_to_user(to, from, n);
	}
	return n;
}

```

### iovec
let's first go down the rabbit hole with the iovec option. copyout is called to fill th euser-level buffer buf
https://elixir.bootlin.com/linux/v4.15/source/lib/iov_iter.c#L151 

I would instrument here or in the previous call, this one is one of the options (pipe being the other) so maybe it's more portable and universal to go one level up,
to copy_page_to_iter

```c
static size_t copy_page_to_iter_iovec(struct page *page, size_t offset, size_t bytes,
			 struct iov_iter *i)
{
	size_t skip, copy, left, wanted;
	const struct iovec *iov;
	char __user *buf;
	void *kaddr, *from;

	if (unlikely(bytes > i->count))
		bytes = i->count;

	if (unlikely(!bytes))
		return 0;

	might_fault();
	wanted = bytes;
	iov = i->iov;
	skip = i->iov_offset;
	buf = iov->iov_base + skip;
	copy = min(bytes, iov->iov_len - skip);

	if (IS_ENABLED(CONFIG_HIGHMEM) && !fault_in_pages_writeable(buf, copy)) {
		kaddr = kmap_atomic(page);
		from = kaddr + offset;

		/* first chunk, usually the only one */
		left = copyout(buf, from, copy);
		copy -= left;
		skip += copy;
		from += copy;
		bytes -= copy;

		while (unlikely(!left && bytes)) {
			iov++;
			buf = iov->iov_base;
			copy = min(bytes, iov->iov_len);
			left = copyout(buf, from, copy);
			copy -= left;
			skip = copy;
			from += copy;
			bytes -= copy;
		}
		if (likely(!bytes)) {
			kunmap_atomic(kaddr);
			goto done;
		}
		offset = from - kaddr;
		buf += copy;
		kunmap_atomic(kaddr);
		copy = min(bytes, iov->iov_len - skip);
	}
	/* Too bad - revert to non-atomic kmap */

	kaddr = kmap(page);
	from = kaddr + offset;
	left = copyout(buf, from, copy);
	copy -= left;
	skip += copy;
	from += copy;
	bytes -= copy;
	while (unlikely(!left && bytes)) {
		iov++;
		buf = iov->iov_base;
		copy = min(bytes, iov->iov_len);
		left = copyout(buf, from, copy);
		copy -= left;
		skip = copy;
		from += copy;
		bytes -= copy;
	}
	kunmap(page);

done:
	if (skip == iov->iov_len) {
		iov++;
		skip = 0;
	}
	i->count -= wanted - bytes;
	i->nr_segs -= iov - i->iov;
	i->iov = iov;
	i->iov_offset = skip;
	return wanted - bytes;
}
```



### raw_copy_to_user
this is unfortunately architecture-dependent, so I picked the x86 64 bit version
 
https://elixir.bootlin.com/linux/v4.15/source/arch/x86/include/asm/uaccess_64.h#L107

```c

static __always_inline __must_check unsigned long
raw_copy_to_user(void __user *dst, const void *src, unsigned long size)
{
	int ret = 0;

	if (!__builtin_constant_p(size))
		return copy_user_generic((__force void *)dst, src, size);
	switch (size) {
	case 1:
		__uaccess_begin();
		__put_user_asm(*(u8 *)src, (u8 __user *)dst,
			      ret, "b", "b", "iq", 1);
		__uaccess_end();
		return ret;
	case 2:
		__uaccess_begin();
		__put_user_asm(*(u16 *)src, (u16 __user *)dst,
			      ret, "w", "w", "ir", 2);
		__uaccess_end();
		return ret;
	case 4:
		__uaccess_begin();
		__put_user_asm(*(u32 *)src, (u32 __user *)dst,
			      ret, "l", "k", "ir", 4);
		__uaccess_end();
		return ret;
	case 8:
		__uaccess_begin();
		__put_user_asm(*(u64 *)src, (u64 __user *)dst,
			      ret, "q", "", "er", 8);
		__uaccess_end();
		return ret;
	case 10:
		__uaccess_begin();
		__put_user_asm(*(u64 *)src, (u64 __user *)dst,
			       ret, "q", "", "er", 10);
		if (likely(!ret)) {
			asm("":::"memory");
			__put_user_asm(4[(u16 *)src], 4 + (u16 __user *)dst,
				       ret, "w", "w", "ir", 2);
		}
		__uaccess_end();
		return ret;
	case 16:
		__uaccess_begin();
		__put_user_asm(*(u64 *)src, (u64 __user *)dst,
			       ret, "q", "", "er", 16);
		if (likely(!ret)) {
			asm("":::"memory");
			__put_user_asm(1[(u64 *)src], 1 + (u64 __user *)dst,
				       ret, "q", "", "er", 8);
		}
		__uaccess_end();
		return ret;
	default:
		return copy_user_generic((__force void *)dst, src, size);
	}
}

```


### copy_user_generic

https://elixir.bootlin.com/linux/v4.15/source/arch/x86/include/asm/uaccess_64.h#L28 

```c
static __always_inline __must_check unsigned long
copy_user_generic(void *to, const void *from, unsigned len)
{
	unsigned ret;

	/*
	 * If CPU has ERMS feature, use copy_user_enhanced_fast_string.
	 * Otherwise, if CPU has rep_good feature, use copy_user_generic_string.
	 * Otherwise, use copy_user_generic_unrolled.
	 */
	alternative_call_2(copy_user_generic_unrolled,
			 copy_user_generic_string,
			 X86_FEATURE_REP_GOOD,
			 copy_user_enhanced_fast_string,
			 X86_FEATURE_ERMS,
			 ASM_OUTPUT2("=a" (ret), "=D" (to), "=S" (from),
				     "=d" (len)),
			 "1" (to), "2" (from), "3" (len)
			 : "memory", "rcx", "r8", "r9", "r10", "r11");
	return ret;
}
```

### alternative_call_2
I think this is going too far at this point lol
https://elixir.bootlin.com/linux/v4.15/source/arch/x86/include/asm/alternative.h#L219

```c

/*
 * Like alternative_call, but there are two features and respective functions.
 * If CPU has feature2, function2 is used.
 * Otherwise, if CPU has feature1, function1 is used.
 * Otherwise, old function is used.
 */
#define alternative_call_2(oldfunc, newfunc1, feature1, newfunc2, feature2,   \
			   output, input...)				      \
{									      \
	asm volatile (ALTERNATIVE_2("call %P[old]", "call %P[new1]", feature1,\
		"call %P[new2]", feature2)				      \
		: output, ASM_CALL_CONSTRAINT				      \
		: [old] "i" (oldfunc), [new1] "i" (newfunc1),		      \
		  [new2] "i" (newfunc2), ## input);			      \
}
```