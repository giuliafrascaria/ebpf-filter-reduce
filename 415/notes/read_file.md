## task

I want to write a bpf program that is attached to a read syscall on a specific file (first find right fd or filename(?))
the function reads numbers from the file and computes max/min/avg or whatever

- use kprobe or uprobe?
kprobe

- what level should I instrument?
good question, I can basically place the instrumentation on every level of the file system

|---------------------
|  Application       |   <----- ??
|---------------------
| Syscall Interface  |   <----- syscall_read() write()
|---------------------
|     VFS            |   <----- vfs_read() sys_write
|---------------------
|  File System       |   <----- file system's write method
|---------------------
|  Volume Manager    |   <-----
|---------------------
|   Block Device     |   <-----
|--------------------|

file data format:
int int int int int ...

length is bound to 10 values for now

## process

Ideally, the user will be able to attach the module to a filename of interest like this

./attach_file <filename> <function>

for example, ./attach_file numfile min
will attach to the numfile file and compute the min function on that.

### Problems:
In order to implement this, I need to hook the open syscall to get the file descriptor, and then the read syscall on that file descriptor (or somewhere down the I/O path) to access the content of the file

- from the user part of the module, how can I pass the filename to the bpf program?

- should I extend the functionality of bpf_probe_attach to include an attach to file?
https://elixir.bootlin.com/linux/latest/source/kernel/bpf/syscall.c#L1882

maybe bpf_object_pin?
https://elixir.bootlin.com/linux/v4.15/source/samples/bpf/fds_example.c

UPDATE 20/11

Ok I can just use a map to do that, for now. In the future I want to actually attach the function to the FILE specifically and not to the open syscall, so that it is not called every single time an open happens in the system (note to future self: possibly extend file system functionality to link in the inode the list of active bpf hooks? or somewhere else to make it file-system independent, this is for another day).

Now the problem is that it's actually more like 3 maps that I need for the full process.
On the user side I identify the file by filename. At the entry point of the open syscall that's all I have.
The call to open will trigger the bpf extension and I need to already give bpf some information so that I have to keep track of it. On the syscall_exit_open I actually have the file descriptor, which is what the read instrumentation will also use.

- user side loads the bpf program and writes the (pointer to) the filename in the map, then calls the open to that file
- the kern side has a syscall_enter_open instrumentation. Reads the map and finds the filename (pointer)

Nope scrap all that, there should be an easier way if we allow the user from user side to put the fd in the map.
The user can put the fd in the map after the open happens, then I can instrument only on the read and check if the current file descriptor is the same that is saved on the map
