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

```
read()		userland program
sys_read()      kernel handler 


```

