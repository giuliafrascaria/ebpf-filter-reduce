## where to hook

one of the problems I need to solve with ebpf is that I need to decide were to hook the instrumentation. This influences the performance gain that I can potentially obtain from the thesis
[programmable ssd in datacenter](https://cacm.acm.org/magazines/2019/6/237002-programmable-solid-state-storage-in-future-cloud-datacenters/fulltext?mobile=false)


ebpf is powerful and can be used to hook at many different anchor points. Let's suppose we have the following scenario

```


CLIENT -------------------------------------	DATACENTER  -------SSD
		     1GB/s link				    -------SSD
       -------------------------------------		    -------SSD
		      RTT 10ms

```

if we want to make operations on 10GB of data, in the current scenario we need to:
- retrieve it from the SSD
- process throught the datacenter software stack (kernel space to user space)
- transfer across the network
- process through user software stack (kernel space to user space)

A back of the envelope estimate of the latency is

1RTT for request + 1RTT for data transfer + network transfer time (size/bw = 10s) + 2 x processing time + storage transfer time 

