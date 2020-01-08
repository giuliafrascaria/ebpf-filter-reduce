## activity log

### 5/6/2020
- fixed the setup on the more powerful laptop (new vm and thesis setup)
- recompiled the kernel to have parallel read path, now I should be able to hook to read from file only

### 6/6/2020
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

## 7/6/2020
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

### 8/8/2020
- debugging the read tracepoint hook. I have an issue with the value being read from the second map, so from kernel to user
- in order to understand what is going on there, I am trying to play with two tracepoint examples that are in the kernel tree (syscall_tp, ibumad, cpustat)
- todo: create external helper function 
- insider paper
- test boundaries of bpf (modify, stop, )
- alternate path on map, returning the sum of the integers on map
- databricks