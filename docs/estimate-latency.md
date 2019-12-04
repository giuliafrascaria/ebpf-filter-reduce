## where to hook

one of the problems I need to solve with ebpf is that I need to decide were to hook the instrumentation. This influences the performance gain that I can potentially obtain from the thesis
[programmable ssd in datacenter](https://cacm.acm.org/magazines/2019/6/237002-programmable-solid-state-storage-in-future-cloud-datacenters/fulltext?mobile=false)


ebpf is powerful and can be used to hook at many different anchor points. Let's suppose we have the following scenario

```

																						______________
CLIENT -------------------------------------|	DATACENTER |-------SSD
		     					1GB/s link				    		|						 |-------SSD
       -------------------------------------|____________|-------SSD
		      RTT 10ms

```

if we want to make operations on 10GB of data, in the current scenario we need to:
- retrieve it from the SSD
- process throught the datacenter software stack (kernel space to user space)
- transfer across the network
- process through user software stack (kernel space to user space)

A back of the envelope estimate of the latency is

1RTT for request + 1RTT for data transfer + network transfer time (size/bw = 10s) + 2 x processing time + storage transfer time

### hook placement
clearly, the major component for latency reduction is eliminating the network transfer time.
For this reason, the user will be given an api on client side, but the bpf extension will hook a function in the datacenter stack.

this leaves us with the latency:
- DC processing time + storage transfer time

Assuming that we do not have the possibility to actually push functionality inside the storage itself, the goal is to optimize the processing time. An operation on data will trigger a read call from userspace. Underneath, the kernel translates this in a file-system relevant operation through the VFS, and actually perform the I/O

![from Brendsn Gregg's book, BPF performance tools](images/bpf-disk.png)
