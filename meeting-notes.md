### meeting 13/2/2020
- cat current kprobes
- mmap instead of malloc
- put printk everywhere (copyout, probe_read)
- printk on complete read path, with condition of ssize  size_t bytes 4095 bytes
- try to get mmapped to known fixed address
- look for log for bpf
- check physical address of user buff -> map own page table to see if physical address is the same between kernel and userspace address space

### meeting 6/2/2020
- check if kprobe or tracepoint
- static or dynamic tracing??
- recompile with kprobe 
- flashR zheng, blas-on-flash 

### meeting 30/1/2020
- have a look at uring api

### meeting 23/1/2020
- how to communicate bween kernel and bpf code
- test whitelisted function as bpf helper
- if-else branch on bpf vs copyout
- bpf read buffer
- check if I can move to 5.4
- google LSM 

### meeting 16/1/2020
- meeting: how to identify user context from bpf -> task struct?? file * in vfs read or deadbeef/whatever signature
- how does code call helper function or is it a context switch
- assume I'm only 1 reader of file for now
- figure out bpf error codes

### meeting 8/1/2020
- todo: create external helper function 
- insider paper
- test boundaries of bpf (modify, stop, )
- alternate path on map, returning the sum of the integers on map
- databricks


