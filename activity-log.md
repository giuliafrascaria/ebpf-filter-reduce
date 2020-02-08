## activity log

### 8/2/2020
- fixed the kernel from yesterday's compilation errors
- started preparing slides for thursday's presentation
- added some functions to kprobe, now I can better follow the path 
```
readiter-2425  [000] ....  5644.654606: 0: ext4 file read
readiter-2425  [000] .N..  5644.654636: 0: generic file read
readiter-2425  [000] ....  5644.654744: 0: copy_page_to_iter
readiter-2425  [000] .N..  5644.654758: 0: copy_page_to_iter_iovec
readiter-2425  [000] d...  5644.654793: 0: entering copyout
readiter-2425  [000] d...  5644.654805: 0: copyout to 0x00000000b0417f58 from 0x000000005f6ccaf9 len 16
```
### 7/2/2020
- tried to make bpf_probe_read work. There is something wrong with the call in copyout because the call in tracex1 seems to work and is identical
- recompiling the kernel again to export more symbols that I can hoook
- why is the kernel address always the same 
```
        readiter-18721 [000] .... 18373.674726: 0: entering copyout
        readiter-18721 [000] .... 18373.674728: 0: copyout to 0x00000000184b7294 from 0x000000001461c6d7 len 16
        readiter-18724 [003] .... 18387.905358: 0: copy_page_to_iter
        readiter-18724 [003] d... 18387.905385: 0: entering copyout
        readiter-18724 [003] d... 18387.905388: 0: copyout to 0x00000000e68cad05 from 0x000000001461c6d7 len 16
           <...>-18727 [000] d... 18389.551760: 0: copy_page_to_iter
           <...>-18727 [000] d... 18389.551787: 0: entering copyout
           <...>-18727 [000] d... 18389.551789: 0: copyout to 0x000000001e0fe4fd from 0x000000001461c6d7 len 16
        readiter-18729 [003] d... 18390.777455: 0: copy_page_to_iter
        readiter-18729 [003] d... 18390.777579: 0: entering copyout
        readiter-18729 [003] d... 18390.777581: 0: copyout to 0x0000000092e06c4a from 0x000000001461c6d7 len 16
           <...>-18796 [000] .... 18581.927487: 0: copy_page_to_iter
           <...>-18796 [000] d... 18581.927497: 0: entering copyout
           <...>-18796 [000] d... 18581.927499: 0: copyout to 0x000000009f4b80bd from 0x000000001461c6d7 len 16
           <...>-18798 [000] .... 18582.947198: 0: copy_page_to_iter
           <...>-18798 [000] d... 18582.947212: 0: entering copyout
           <...>-18798 [000] d... 18582.947214: 0: copyout to 0x000000005afc398c from 0x000000001461c6d7 len 16
```
### 5/2/2020
- now that the compilation is fixed, the problem is getting the kprobe to work again!
- first I thought it was a problem with linux_version_code because in /usr/include/ the headers were still for 4.15 and there was a version mismatch
- after fixing that, it in fact turns out from the strace that the kernel version check is passed, and the failure happens when trying to attach a kprobe
- checking dmesg thanks to a life saving internet post, I found out that the error is that I'm trying to probe a notrace function T_T 
- apparently that function was turned to notrace with kernel 5.4
- I think I have to recompile with CONFIG_KPROBE_EVENTS_ON_NOTRACE on the functions I want to hook
- https://gitlab.freedesktop.org/panfrost/linux/commit/45408c4f92506dbdfef1721f2613e1426de00894
- https://github.com/iovisor/bcc/issues/2509
- https://github.com/iovisor/bpftrace/issues/206
- https://bolinfest.github.io/opensnoop-native/
```
[ 4631.148994] trace_kprobe: Could not probe notrace function copy_page_to_iter
[ 4723.077755] trace_kprobe: Could not probe notrace function copy_page_to_iter

sudo strace ./hellotrace 
pread64(3, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\3\0\3\0"..., 120, 272) = 120
bpf(BPF_PROG_LOAD, {prog_type=BPF_PROG_TYPE_KPROBE, insn_cnt=15, insns=0x561fad0ee2a0, license="GPL", log_level=0, log_size=0, log_buf=0, kern_version=328704, prog_flags=0}, 120) = 4
openat(AT_FDCWD, "/sys/kernel/debug/tracing/kprobe_events", O_WRONLY|O_APPEND) = 5
write(5, "p:__x64_sys_write __x64_sys_writ"..., 33) = 33
close(5)     

sudo strace ./readiter f
bpf(BPF_PROG_LOAD, {prog_type=BPF_PROG_TYPE_KPROBE, insn_cnt=11, insns=0x55b5b14462b0, license="GPL", log_level=0, log_size=0, log_buf=0, kern_version=328704, prog_flags=0}, 120) = 4
openat(AT_FDCWD, "/sys/kernel/debug/tracing/kprobe_events", O_WRONLY|O_APPEND) = 5
write(5, "p:copy_page_to_iter copy_page_to"..., 37) = -1 EINVAL (Invalid argument)
close(5)                                = 0
```

### 2/2/2020
- same as yesterday, trying to build 5.4 samples
- obrained verbose output from kernel make samples and isolated a user function
- I FIXED IT. I used the includes of the makefile verbose output, and I disabled the test attribute in perf-sys.h 

```
make M=samples/bpf/ -n

set -e;  echo '  HOSTCC  samples/bpf//tracex1_user.o'; 

	gcc -Wp,-MD,samples/bpf//.tracex1_user.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 
	-fomit-frame-pointer -std=gnu89   -I./usr/include -I./tools/lib/bpf/ -I./tools/testing/selftests/bpf/ -I./tools/lib/ -I./tools/include -I./tools/perf 
	-DHAVE_ATTR_TEST=0     -c -o samples/bpf//tracex1_user.o samples/bpf//tracex1_user.c; scripts/basic/fixdep samples/bpf//.tracex1_user.o.d samples/bpf//tracex1_user.o 

	'gcc -Wp,-MD,samples/bpf//.tracex1_user.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89   
	-I./usr/include -I./tools/lib/bpf/ -I./tools/testing/selftests/bpf/ -I./tools/lib/ -I./tools/include -I./tools/perf -DHAVE_ATTR_TEST=0     
	-c -o samples/bpf//tracex1_user.o samples/bpf//tracex1_user.c' 

	> samples/bpf//.tracex1_user.o.cmd; rm -f samples/bpf//.tracex1_user.o.d

set -e;  echo '  HOSTLD  samples/bpf//tracex1'; gcc   -o samples/bpf//tracex1 samples/bpf//bpf_load.o samples/bpf//tracex1_user.o   
	/home/giogge/linux/samples/bpf/../../tools/lib/bpf/libbpf.a -lelf ; printf '%s\n' 'cmd_samples/bpf//tracex1 := gcc   
	-o samples/bpf//tracex1 samples/bpf//bpf_load.o samples/bpf//tracex1_user.o   /home/giogge/linux/samples/bpf/../../tools/lib/bpf/libbpf.a -lelf ' 
	> samples/bpf//.tracex1.cmd
```
### 1/2/2020
- trying to compile with -nostdinc, very complex and honestly think it's not worth it
- -iquote forces to look in local dir first, even for includes in <> form. Will use it for the makefile

### 30/1/2020
- meeting

### 28/1/2020
-basically just trying to compile the samples. following this link as reference for out of tree headers that need to be included 
-https://github.com/netoptimizer/prototype-kernel

### 27/1/2020
- I am trying to port everything to 5.4 cause I think it's better that way
- the issue with asm is resolved, the kernel modules are working, the problem now is in the user side
- includes are missing, need to find the headers that are necessary to link those binaries

```
making ...buffermap
/tmp/ccFd33g3.o: In function `sys_perf_event_open':
bpf_load.c:(.text+0x48): undefined reference to `test_attr__enabled'
bpf_load.c:(.text+0x72): undefined reference to `test_attr__open'
collect2: error: ld returned 1 exit status
```

### 26/1/2020
- collected the trace for the read on 5.4 kernel, so I can recompile the parallel read path appropriately
- recompiled the read path on kernel 5.4

### 25/1/2020
- continuing to work on kernel 5.4. the samples in kernel need to be built differently 
- https://www.spinics.net/lists/xdp-newbies/msg01391.html
- don't understand if llvm supports bpf now, compiling the llvm infrastructure from source to see if it works
- https://github.com/torvalds/linux/tree/v5.4/samples/bpf
- I believe that the asm_volatile issue that I had in kernel 5.3 has been solved in 5.4 by the asm_goto_workaround.h that I can see in the samples/bpf/ so I might need to include that in the compilation of my own samples
- bpf_probe_read only works for tracing programs(defined in kernel/trace/bpf_trace.c)

### 24/1/2020
- recompiled kernel for 5.4 and tried to get bpf to work

### 22/1/2020
- explored the kprobe of copyout now that I hook the desired point. found a way to access the register parameters
- PROBLEM! unfortunately the verifier does not allow direct derefenrence of the pointer
- bpf probe read does not respond, keeps behaving like before not even entering the error print

```
direct access:
eBPF file to be loaded is : ./readiter_kern.o 
bpf_load_program() err=13
0: (79) r3 = *(u64 *)(r1 +112)
1: (79) r4 = *(u64 *)(r1 +104)
2: (71) r5 = *(u8 *)(r4 +0)
R4 invalid mem access 'inv'
0: (79) r3 = *(u64 *)(r1 +112)
1: (79) r4 = *(u64 *)(r1 +104)
2: (71) r5 = *(u8 *)(r4 +0)
R4 invalid mem access 'inv'
```

```
with bpf_probe_read:

        readiter-4338  [001] ....  8840.649057: 0x00000001: copy_page_to_iter
        readiter-4338  [001] .N..  8840.649089: 0x00000001: copy_page_to_iter_iovec
        readiter-4338  [001] d...  8840.649196: 0x00000001: entering copyout
        readiter-4338  [001] d...  8840.649206: 0x00000001: copyout to 0x00000000716fa52a from 0x00000000d352ce1e

???
```

### 19/1/2020
- I am trying to kprobe the new kernel functions that I instrumented. It works with copy_page_to_iter_iov but the problem is that in that page I still don't have the kernel address as a param, so I cannot probe read the chars. I need a function where kaddr has already been called -> copyout or raw_copy_to_user.
- the kprobe on these two functions doesn't seem to work, and in fact I cannot find them in kernel symbols. I probably have to recompile the kernel including the functions in a way that they are not inlined (found these sources online for that)
- https://lwn.net/Articles/598217/
- https://events.static.linuxfound.org/sites/events/files/slides/Handling%20the%20Massive%20Multiple%20Kprobes%20v2_1.pdf
- https://stackoverflow.com/questions/48221631/kprobe-handler-not-getting-triggered-for-specific-function?rq=1
- https://stackoverflow.com/questions/49480167/kprobe-not-working-for-some-functions
- https://stackoverflow.com/questions/43987036/why-cant-kprobe-probe-some-functions-in-the-kernel
- https://lore.kernel.org/patchwork/patch/648777/
- I am recompiling the kernel with export symbol on copyout, hopefully I can kprobe on that

```
cat /proc/kallsyms | grep copyout
          (null) T nanosleep_copyout
          (null) t copyout
          (null) t raw_cmd_copyout.isra.9	[floppy]
giogge@ubuntu18:~/linux/lib$ cat /proc/kallsyms | grep giulia
          (null) t copy_page_to_iter_iovec_giulia
          (null) t copy_page_to_iter_giulia.part.13
          (null) T copy_page_to_iter_giulia
          (null) T _copy_to_iter_giulia
          (null) r __ksymtab__copy_to_iter_giulia
          (null) r __ksymtab_copy_page_to_iter_giulia
          (null) r __kstrtab_copy_page_to_iter_giulia
          (null) r __kstrtab__copy_to_iter_giulia
giogge@ubuntu18:~/linux/lib$ cat /proc/kallsyms | grep raw_copy
          (null) t qxl_draw_copyarea	[qxl]


-------------------------------------
YEEES I have the kernel symbol for copyout giulia

cat /proc/kallsyms | grep copyout
(null) T nanosleep_copyout
(null) t copyout
(null) t copyout_giulia
(null) r __ksymtab_copyout_giulia
(null) r __kstrtab_copyout_giulia
(null) t raw_cmd_copyout.isra.9
```

### 18/1/2020
- trying to debug the bpf_probe_read issue, to understand why it is not responsive
- In the examples, I can see that the probe read is always used in context fields. On read exit for this function I do not have the buffer in the context so I will try to instrument a lower-level function where the buffer is a user paramenter -> probably will have to switch to kprobe
- definitely, the direct access does not work (will check if it works when buff is a parameter)
- I am switching to the lower level functions to hook,  I need a kprobe on functions where I have kernel and user buffer as params. I created the readiter files for playing with kprobes, but I was expecting to hook on the _copy_to_iter_giulia. That is not triggered, iovec is triggered so now I have to recompile the kernel to have that parallel read path as well
- good news is that the copyout function totally looks like what I want to hook

```
        readiter-4731  [001] d... 18410.507377: 0x00000001: copy_page_to_iter
        readiter-4731  [001] d... 18410.507389: 0x00000001: copy_page_to_iter_iovec
        readiter-4731  [001] d... 18410.507391: 0x00000001: copyout
```
### 17/1/2020

- I looked up online and in the bpf helpers, turns out that I can identify the PID with the helper funtion bpf_get_current_pid_tgid >> 32
- in 4.15 this is not available, but in following kernel versions (looking at 5.4 now) there is bpf_get_current_task that returns the whole task struct
- the problem now is that I can identify the right PID and only execute for that, but the bpf_probe_read does not work, it doesn't print anything in either way (success or fail)
- https://github.com/iovisor/bcc/issues/799
- https://github.com/iovisor/bcc/issues/1329

```
buffermap-4261  [002] .... 33911.045475: 0x00000001: pid on map 4261
buffermap-4261  [002] .... 33911.045476: 0x00000001: tgid 4261
buffermap-4261  [002] .... 33911.045479: 0x00000001: buffer on params 94605633736128, buffer on map 94605633736128
buffermap-4261  [002] .... 33911.045481: 0x00000001: matching targeted buffer with param buffer on read entry
buffermap-4261  [002] .... 33911.045488: 0x00000001: pid on map 4261
buffermap-4261  [002] .... 33911.045489: 0x00000001: tgid 4261
buffermap-4261  [002] .... 33911.045491: 0x00000001: read buffer from map on read exit 94605633736128
```
### 16/1/2020

- trying to understand the difference between the two bpf instrumentations readbuff and buffread
- check if the pointer needs to be turned in double pointer to correctly retrieve the buffer address (solve the verifier error)
- now the buffer on map and param match on read entry, good sign, but only the least significant bytes are printed


```
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

----------------------------------------------------------------

buffermap-5963  [001] .... 19121.687272: 0x00000001: buffer on params 219e54b0, buffer on map 219e54b0
buffermap-5963  [001] .... 19121.687274: 0x00000001: matching targeted buffer with param buffer on read entry
buffermap-5963  [001] .... 19121.687282: 0x00000001: read buffer from map 392ffa90

sudo ./buffermap f
welcome
loading bpf extension ./buffermap_kern.o
loaded bpf kernel module
file descriptor user: 3
buffer on user side = 0x5620219e54b0
buffer on user side = 0x5620219e54b0, file value 31
read map value ffffffb0

```
- unfortunate finding: the verifier issue happens when I try to access the char in the user buffer, giving invalid memory access. I probably need to recompile with a bpf helper function that returns the read chars if the current helper function bpf_probe_read doesn't work. will test that tomorrow
- trying to use the bpf_probe_read but the print doesn't show hmm

```
buffermap-8921  [001] .... 29777.210644: 0x00000001: buffer on params 93941785740880, buffer on map 93941785740880
buffermap-8921  [001] .... 29777.210646: 0x00000001: matching targeted buffer with param buffer on read entry
buffermap-8921  [001] .... 29777.210659: 0x00000001: read buffer from map on read exit 93941785740880
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

### 14/1/2020

- I am rewriting a new example where userland passes the buffer instead of the file descriptor. This seems reasonable but I am still reading wrong values
- I think that my include of bpf-helpers is not the right one. In the 4.15 source code the bpf-helpers.h is not in the /samples/bpf folder so it comes from somewhere else. there is one in tools, and it is not the same version that I am including right now

```
cat-2176  [002] ....  5934.275479: 0x00000001: read buffer from map 000000005278ca75
cat-2176  [002] ....  5934.275484: 0x00000001: read buffer from map 000000005278ca75
cat-2176  [002] ....  5934.275491: 0x00000001: read buffer from map 000000005278ca75
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

### 12/1/2020

- trying to make it more targeted, added the pid to the params but it only reads to 0 so it doesn't help
- trying to figure out why the char does not read correctly, I suspect it might be an alignment issue with map values or type issue with signed unsigned stuff

```
cat-2033  [001] ....  5027.061718: 0x00000001: pid on map 2153
cat-2033  [001] ....  5027.061718: 0x00000001: pid on map 0
```

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

### 8/1/2020

- debugging the read tracepoint hook. I have an issue with the value being read from the second map, so from kernel to user
- in order to understand what is going on there, I am trying to play with two tracepoint examples that are in the kernel tree (syscall_tp, ibumad, cpustat)

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

### 5/1/2020

- fixed the setup on the more powerful laptop (new vm and thesis setup)
- recompiled the kernel to have parallel read path, now I should be able to hook to read from file only
