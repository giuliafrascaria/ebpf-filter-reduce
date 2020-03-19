### meeting 19/3/2020
- return average in the map or in the return value
- try to return that in the buffer avoiding to copy the rest of the daata
- test limitations for operations like bpf signed division
- fun things to do with bpf blog post

### meeting 12/3/2020
- experimenting with bpf_strtol
- try to add own helper function

### meeting 5/3/2020
- bpf kernels library
- first step get working examples in kernels and then see what can be pushed to the bpf
- think about claims in thesis, try to write last paragraph of thesis of key contributions
- filters, data reduction operations, what is missing in bpf to get that done
- document what ebpf cannot do
- what did it take to make it work
- how much can be pushed back to bpf
- tuesday meeting call + thursday
- userspace bpf verifier 

### meeting 21/2/2020
- general restriction to pack data in fixed size buffer (4k)
- wrapper to modify first order params -> turn to pointer
- try to modify return value
- write iterator on buffer that avoids copy
- benchmark the cost of probe_read 1mb, read 4k at a time VS copy to userspace 1mb iovec plus doing filtering in userspace
- 1 reading from media
- 2 aggregation/filtering (eg sum)
- 3 return of value
- which copy is faster, kernel 2 kernel or kernel 2 user
- try to use the perf array to debug
- man od
- standard functions like aggregator, filter... that bpf can use
- if user gives certain condition, how to compile so that the user-given condition is passed to the helper
- checksum example either through shared map or rewrite first value of the buffer and interpret that in userspace
- where is the ctx made read only for kprobe? can I disable that?
- prepare summary file of current bpf limitations
- try to study verifier and see if i can disable checks
- bpf helper for dynamic buffer size
- helper function to modify ctx of kprobe 
- see overwrite ret funcion

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


