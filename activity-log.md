## activity log

### 5/1/2020

- fixed the setup on the more powerful laptop (new vm and thesis setup)
- recompiled the kernel to have parallel read path, now I should be able to hook to read from file only

### 6/1/2020

- fixed the headers for 4.15.0+, now there are my functions in the headers that bpf includes
- experimenting with bpf maps

lessons learned:
I can find out the arguments for the tracepoint hooks by calling 
sudo cat /sys/kernel/debug/tracing/events/syscalls/sys_enter_open/format

these arguments can be used to create a struct of arguments that is passed to the bpf code. However, I need to keep track of the bytes 

for example: cpustat args
``` c
struct cpu_args {
	u64 pad;
	u32 state;
	u32 cpu_id;
};


sudo cat /sys/kernel/debug/tracing/events/power/cpu_idle/format
name: cpu_idle
ID: 433
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
	field:int common_pid;	offset:4;	size:4;	signed:1;

	field:u32 state;	offset:8;	size:4;	signed:0;
	field:u32 cpu_id;	offset:12;	size:4;	signed:0;

```
taken from a kernel example, or this one taken from bcc (if i'm not mistaken)
``` c
struct syscalls_enter_open_args 
{
	unsigned long long unused;
	long syscall_nr;
	long filename_ptr;
	long flags;
	long mode;
};


sudo cat /sys/kernel/debug/tracing/events/syscalls/sys_enter_open/format
name: sys_enter_open
ID: 604
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
	field:int common_pid;	offset:4;	size:4;	signed:1;

	field:int __syscall_nr;	offset:8;	size:4;	signed:1;
	field:const char * filename;	offset:16;	size:8;	signed:0;
	field:int flags;	offset:24;	size:8;	signed:0;
	field:umode_t mode;	offset:32;	size:8;	signed:0;

```

struggles:

I have written a program tha passes a file descriptor from userspace to bpf module, and then viceversa. 
I am currently stuck at the execution, the bpf prog load fails with errno 0 so there is something wrong in the kernel module

## 7/1/2020

- trying to debug my bpf code, strace shows that maps are created while the program fails loading. figured out, the problem was a typo in the definition of the SEC(), I was writing \tracepoint and I don't need the slash
- continuing to look into bpf examples
- the execution of the kernel module is now triggered but fails for invalid mem access first, then for wrong value after I added an error check

```
welcome
loading bpf extension ./passfd_kern.o
bpf_load_program() err=13
0: (bf) r6 = r1
1: (b7) r1 = 0
2: (7b) *(u64 *)(r10 -8) = r1
3: (bf) r2 = r10
4: (07) r2 += -8
5: (18) r1 = 0xffff9addc0f18300
7: (85) call bpf_map_lookup_elem#1
8: (79) r1 = *(u64 *)(r0 +0)
R0 invalid mem access 'map_value_or_null'
ERROR: loading BPF program (errno 13):
0: (bf) r6 = r1
1: (b7) r1 = 0
2: (7b) *(u64 *)(r10 -8) = r1
3: (bf) r2 = r10
4: (07) r2 += -8
5: (18) r1 = 0xffff9addc0f18300
7: (85) call bpf_map_lookup_elem#1
8: (79) r1 = *(u64 *)(r0 +0)
R0 invalid mem access 'map_value_or_null'

-----------------------------------------

welcome
loading bpf extension ./passfd_kern.o
bpf_load_program() err=13
0: (bf) r6 = r1
1: (b7) r1 = 0
2: (7b) *(u64 *)(r10 -8) = r1
3: (bf) r2 = r10
4: (07) r2 += -8
5: (18) r1 = 0xffff9addc4f82200
7: (85) call bpf_map_lookup_elem#1
8: (15) if r0 == 0x0 goto pc+10
 R0=map_value(id=0,off=0,ks=4,vs=4,imm=0) R6=ctx(id=0,off=0,imm=0) R10=fp0
9: (79) r1 = *(u64 *)(r6 +16)
10: (79) r2 = *(u64 *)(r0 +0)
 R0=map_value(id=0,off=0,ks=4,vs=4,imm=0) R1=inv(id=0) R6=ctx(id=0,off=0,imm=0) R10=fp0
invalid access to map value, value_size=4 off=0 size=8
R0 min value is outside of the array range
ERROR: loading BPF program (errno 13):
0: (bf) r6 = r1
1: (b7) r1 = 0
2: (7b) *(u64 *)(r10 -8) = r1
3: (bf) r2 = r10
4: (07) r2 += -8
5: (18) r1 = 0xffff9addc4f82200
7: (85) call bpf_map_lookup_elem#1
8: (15) if r0 == 0x0 goto pc+10
 R0=map_value(id=0,off=0,ks=4,vs=4,imm=0) R6=ctx(id=0,off=0,imm=0) R10=fp0
9: (79) r1 = *(u64 *)(r6 +16)
10: (79) r2 = *(u64 *)(r0 +0)
 R0=map_value(id=0,off=0,ks=4,vs=4,imm=0) R1=inv(id=0) R6=ctx(id=0,off=0,imm=0) R10=fp0
invalid access to map value, value_size=4 off=0 size=8
R0 min value is outside of the array range
```

### 8/1/2020

- debugging the read tracepoint hook. I have an issue with the value being read from the second map, so from kernel to user
- in order to understand what is going on there, I am trying to play with two tracepoint examples that are in the kernel tree (syscall_tp, ibumad, cpustat)
- todo: create external helper function 
- insider paper
- test boundaries of bpf (modify, stop, )
- alternate path on map, returning the sum of the integers on map
- databricks

### 11/1/2020

- working on bpf samples, trying to read buffer content and copy to shared map (or checksum or whatever)
- the problems I encountered today are with buffer and buffer content. I don't seem to always 
- todo: add the PID to the map and filter with that, try to change the hook point (did the buffer copy already happen?) try with kprobe
```
welcome
loading bpf extension ./readbuff_kern.o
loaded bpf kernel module
file descriptor user: 3
buffer on user side = 0x55a546957270, file value 31
read buffer from map: 0x7fe39d34a000, map value 0


giogge@ubuntu18:~/thesis/ebpf-experiments/415/src/compiled$ sudo ./readbuff f
welcome
loading bpf extension ./readbuff_kern.o
loaded bpf kernel module
file descriptor user: 3
buffer on user side = 0x559f59142270, file value 31
read buffer from map: 0x559f59142270, map value 70
```

### 12/1/2020

- trying to make it more targeted, added the pid to the params but it only reads to 0 so it doesn't help
- trying to figure out why the char does not read correctly, I suspect it might be an alignment issue with map values or type issue with signed unsigned stuff

```
cat-2033  [001] ....  5027.061718: 0x00000001: pid on map 2153
cat-2033  [001] ....  5027.061718: 0x00000001: pid on map 0
```

### 13/1/2020

- read source code to find out how helper functions are used in the bpf infrastructure
- tested the code again, there is an issue with the file descriptor (and I think it's strange that it is consistently file descriptor 3 hmm)
- the buffer address is also unstable, not always the same
- Are the parameters being consumed in some way? is another process writing the parameters cause the identification is not unique? Who knows

```
buffer on user side = 0x56482deca3e0, file value 31
read buffer from map: 0x7f7efc861000, map value 0

buffer on user side = 0x55cbd9f9d3e0, file value 31
read buffer from map: 0x55cbd9f9d3e0, map value ffffffe0

------------------------------------------------------

readbuff-2061  [000] ....  4076.401405: 0x00000001: fd on params 10
sshd-2029  [003] ....  4076.401434: 0x00000001: fd on params 11
sshd-2029  [003] ....  4076.401657: 0x00000001: fd on params 11
readbuff-2061  [000] ....  4076.401696: 0x00000001: fd on params 3
readbuff-2061  [000] ....  4076.401697: 0x00000001: matching targeted file descriptor and pid on read entry
sshd-1870  [003] ....  4076.401712: 0x00000001: fd on params 11
cat-2059  [003] ....  4076.401766: 0x00000001: fd on params 3
```

### 14/1/2020

- I am rewriting a new example where userland passes the buffer instead of the file descriptor. This seems reasonable but I am still reading wrong values
- I think that my include of bpf-helpers is not the right one. In the 4.15 source code the bpf-helpers.h is not in the /samples/bpf folder so it comes from somewhere else. there is one in tools, and it is not the same version that I am including right now

```
cat-2176  [002] ....  5934.275479: 0x00000001: read buffer from map 000000005278ca75
cat-2176  [002] ....  5934.275484: 0x00000001: read buffer from map 000000005278ca75
cat-2176  [002] ....  5934.275491: 0x00000001: read buffer from map 000000005278ca75
```

### 15/1/2020

- judging from the makefile in the kernel source for the bpf samples, the include path for the headers includes this one https://elixir.bootlin.com/linux/v4.15/source/tools/testing/selftests/bpf/bpf_helpers.h#L12
- so I think that this is the version of bpf helpers that I should be using, so it seems correct
- https://elixir.bootlin.com/linux/v4.15/source/tools/lib/bpf/bpf.h#L61
- even the entry on read reads the wrong value from the buffer, need to debug it so that at least that works like is does in readbuff
- watched videos (and mailing list discussion) about the google security extension using ebpf. I think it can be useful to look at because if I understood correctly they hook files, need to see how they identified then


```
sudo cat /sys/kernel/debug/tracing/trace_pipe | grep buffermap
       buffermap-3142  [002] .... 24707.068272: 0x00000001: buffer on params 000000003b586c71, buffer on map 0000000069c09fff
       buffermap-3142  [002] .N.. 24707.068280: 0x00000001: buffer value mismatch on read entry
       buffermap-3142  [000] .... 24707.069222: 0x00000001: buffer on params 000000001991f4a0, buffer on map 0000000069c09fff
       buffermap-3142  [000] .... 24707.069236: 0x00000001: buffer value mismatch on read entry
       buffermap-3142  [000] .... 24707.069238: 0x00000001: read buffer from map 0000000069c09fff


welcome
loading bpf extension ./buffermap_kern.o
loaded bpf kernel module
file descriptor user: 3
buffer on user side = 0x5561a6778460, file value 31
read map value 60
```

### 16/1/2020

- trying to understand the difference between the two bpf instrumentations

sudo ./buffermap f
welcome
loading bpf extension ./buffermap_kern.o
loaded bpf kernel module
file descriptor user: 3
buffer on user side = 0x559d5718d450, file value 31
read map value 50


giogge@ubuntu18:~/thesis/ebpf-experiments/415/src/compiled$ sudo ./readbuff f
welcome
loading bpf extension ./readbuff_kern.o
loaded bpf kernel module
file descriptor user: 3
buffer on user side = 0x556bd56843e0, file value 31
read buffer from map: 0x556bd56843e0, map value ffffffe0
giogge@ubuntu18:~/thesis/ebpf-experiments/415/src/compiled$ 
