# Anatomy of a read()

what happens underneath a read syscall? I need to understand all the layers of the file system involved in the I/O process, so that I know which point I can hook with my BPF extensions

once upon a time in the userland, someone triggered a read syscall

`
int read(int fd, void buf, sizet count)
`

read is a syscall, so at this point we trap in the kernel to trigger the syscall
- http://man7.org/linux/man-pages/man2/intro.2.html
- http://man7.org/linux/man-pages/man2/syscalls.2.html
- http://man7.org/linux/man-pages/man2/syscall.2.html
- https://doc.lagout.org/operating%20system%20/linux/Understanding%20Linux%20Kernel.pdf

The system call handler, which has a structure similar to that of the other exception handlers, performs the following operations:
• Saves the contents of most registers in the Kernel Mode stack (this operation is common to all system calls and is coded in assembly language).
• Handles the system call by invoking a corresponding C function called the system call service routine.
• Exits from the handler


The name of the service routine associated with a syscall whatever is generally `sys_whatever()`, so in this case the service routine is:
`
sys_read()
`


`
vfs_read()
`

