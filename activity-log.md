## activity log

### 11/7/2020
- experimented with single read from big file

### 10/7/2020
- benchmarked more in detail the behavior of the override exec
- graphed based on the number of iterations, looka like it starts to fail consistently once the iterations lead dto read more than approx 100mb of data
- doesn't seem to be influenced by vfs_pressure
- https://manybutfinite.com/post/page-cache-the-affair-between-memory-and-files/


### 9/7/2020
- started creating the ramdisk to experiment with that, so far it doesn't change but no clue if i'm using that correclty
- https://people.freedesktop.org/~narmstrong/meson_drm_doc/admin-guide/initrd.html
- https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/blockdev/ramdisk.rst
- https://www.kernel.org/doc/html/latest/admin-guide/blockdev/ramdisk.html
- https://www.techrepublic.com/article/how-to-use-a-ramdisk-on-linux/

```
sudo mkdir -p /media/ramdisk
sudo mount -t tmpfs -o size=2048M tmpfs /media/ramdisk

sudo dd if=/dev/zero of=/dev/ram0 bs=1k count=2048
sudo mke2fs -vm0 /dev/ram0 2048
sudo mount -t ext2 -o loop /dev/ram0 /home/giogge/thesis/ebpf-experiments/57/compiled/ramdisk/

```

### 5/7/2020
- the readahead function kprobes don't seem to be triggered
- the mmap shared doesn't really change things
- recompiling to catch generic file buffered read
- installed bcc tools in /usr/share/bcc
- todo: put printks in file buffered read to understand if it goes to the readahead part


### 1/7/2020
- found out that with readahead or WILLNEED, plus fsync to hopefully free page cache, the success rate is much higher
- set up cgroup to see if assigning more virtual memory to the process can improve this, or make sure to invalidate the page cache every time
- this should ensure that every new read will actually go through a readahead
- generate skeleton 

```
bpftool gen skeleton procfs_override_kern.o > procfs_override.skel.h
```


### 21/6/2020
- https://linuxplumbersconf.org/event/4/contributions/448/attachments/345/575/bpf-usability.pdf btf presentation fb
- created the kernel module but can't instrument if I use btf cause vmlinux doesn't know the function, although it is in the kallsyms
- reading the linux device drivers to find out how to put modules in source tree


### 20/6/2020
- writing kernel module to test single operation of fmod ret
- problem with the procfs infrastructure https://lore.kernel.org/linux-fsdevel/20191225172228.GA13378@avx2/
- for now the read does not seem to be called so I need to investigate tomorrow


### 18/6/2020
- fentry does not seem to trigger a call to pbf printk, which makes it very hard to debug xD
- /tools/lib/bpf/bpf_helper_defs.h probably the place where I should be adding all new helpers
- asof now fentry fmod fexit doesn't seem to work. am I even being called? the testbed reads from copyout
- write a small example function to experiment and understand how it works
- I suspect the probes are not even being triggered


### 17/6/2020
- selftest compilation https://github.com/hlandau/acme.t/issues/1
- https://github.com/torvalds/linux/tree/master/tools/testing/selftests/bpf
- https://github.com/torvalds/linux/blob/master/Documentation/bpf/bpf_devel_QA.rst#q-how-to-run-bpf-selftests
- probably also wrong clang version for some stuff
- updated clang and llvm to version 10, also had to remove 6.0 and create the symlink from clang-10 and llc-10 to clang and llc

```
fatal error: sys/capability.h: No such file or directory
 #include <sys/capability.h>
          ^~~~~~~~~~~~~~~~~~

teying to solve with 
sudo apt-get install libcap-dev

error: use of unknown builtin '__builtin_preserve_access_index'

sudo ln -s /usr/bin/llc-10 /usr/bin/llc
```
- exploring fentry feature. the vmlinux that I generate with bpftool is completely broken
- I can avoid including it and it compiles, but doesn't find the copyout and copyout_bpf in vmlinux
- it does find ksys_read. I generated objdump for the kernel sources on iov_iter and read_write to see differences, can't see anything, however the ksym is global
- the examples for fentry in the kernel are compiled with noinline https://elixir.bootlin.com/linux/v5.7/source/net/bpf/test_run.c#L150
- and in line 119 of this file will be in the vmlinux btf, so it makes sense that I can onli see ksys_read which is global in kallsyms
- need to recompile with noinline to have that
- super useful talk on ftrace that made me look at the assembly code http://www.brendangregg.com/blog/2019-10-15/kernelrecipes-kernel-ftrace-internals.html

```
cat /proc/kallsyms | grep ksys_read
0000000000000000 T ksys_readahead
0000000000000000 T ksys_read

cat /proc/kallsyms | grep copyout
0000000000000000 T nanosleep_copyout
0000000000000000 t copyout_mcsafe
0000000000000000 t copyout
0000000000000000 t copyout_bpf
```

### 14/6/2020 
- going to 5.7 stable so I can hopefully finally settle, shouldn't be a problem
- cloned https://github.com/acmel/dwarves.git
- installed cmake and libdw-dev
- the vmlinux was created but maybe the btf failed for this error I got during compilation
- followed this sudo /sbin/ldconfig -v https://itsfoss.com/solve-open-shared-object-file-quick-tip/

```
pahole: error while loading shared libraries: libdwarves_reorganize.so.1: cannot open shared object file: No such file or directory
scripts/link-vmlinux.sh: 123: [: Illegal number: 
  LD      .tmp_vmlinux.btf
  BTF     .btf.vmlinux.bin.o
pahole: error while loading shared libraries: libdwarves_reorganize.so.1: cannot open shared object file: No such file or directory

```

```
BTF: .tmp_vmlinux.btf: pahole version v1.9 is too old, need at least v1.13

bpf_load_program() err=22
in-kernel BTF is malformed
processed 0 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
in-kernel BTF is malformed
processed 0 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0

```
- now the problem is with vmlinux I think, doesn't contain the information for copyout bpf whatever that might mean
- bpftool --version is 5.4, maybe if I update to 5.7 YES IT WORKED; COULD GENERATE VMLINUX
- https://lore.kernel.org/patchwork/patch/865992/
- https://github.com/iovisor/bcc/issues/2872
- https://lore.kernel.org/netdev/d8620b04-346a-11eb-000f-34d0f9f0cd51@fb.com/
- https://facebookmicrosites.github.io/bpf/blog/2020/02/19/bpf-portability-and-co-re.html
- https://github.com/iovisor/bcc/issues/2855
- http://patchwork.ozlabs.org/project/netdev/patch/20191018103404.12999-1-jolsa@kernel.org/#2285034
- https://www.kernel.org/doc/html/latest/bpf/btf.html btf guide
- vmlinux not found https://lore.kernel.org/bpf/4BBF99E4-9554-44F7-8505-D4B8416554C4@redhat.com/t/ this is the source of the github thingy
- https://github.com/iovisor/bcc/issues/2770
- github example fentry from patch mail https://github.com/chaudron/bpf2bpf-tracing 


```
sudo ./fentry_test 
eBPF file to be loaded is : ./fentry_test_kern.o 
libbpf: copyout_bpf is not found in vmlinux BTF
------

bpftool btf dump file /sys/kernel/btf/vmlinux format c > vmlinux.h

libbpf: failed to get EHDR from /sys/kernel/btf/vmlinux
Error: failed to load BTF from /sys/kernel/btf/vmlinux: Unknown error -4001

```

```
grep -E -i "btf|bpf" .config
CONFIG_CGROUP_BPF=y
CONFIG_BPF=y
CONFIG_BPF_LSM=y
CONFIG_BPF_SYSCALL=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_IPV6_SEG6_BPF=y
# CONFIG_NETFILTER_XT_MATCH_BPF is not set
# CONFIG_BPFILTER is not set
# CONFIG_NET_CLS_BPF is not set
# CONFIG_NET_ACT_BPF is not set
CONFIG_BPF_JIT=y
CONFIG_BPF_STREAM_PARSER=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_DEBUG_INFO_BTF=y
CONFIG_BPF_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
# CONFIG_TEST_BPF is not set

```


### 13/6/2020
- long time no see!
- getting back on track with the thesis, reading documents to understandd how to compile without support in bpf_load
- https://www.kernel.org/doc/html/latest/bpf/bpf_lsm.html vmlinux generation
- bpftool to generate mysterrious skeleton? or otherwise just obj open and obj load
- https://facebookmicrosites.github.io/bpf/blog/2020/02/20/bcc-to-libbpf-howto-guide.html
- https://github.com/iovisor/bcc/issues/2872 recompile kernel with btf support
- CONFIG_DEBUG_INFO_BTF=y
- failed, looks like the problem might be binutils version?
- https://lore.kernel.org/bpf/20191127000420.GG3145429@mini-arch.hsd1.ca.comcast.net/t/

```
sudo ./fentry_test 

eBPF file to be loaded is : ./fentry_test_kern.o 
libbpf: failed to find valid kernel BTF
libbpf: Error loading vmlinux BTF: -3
libbpf: failed to load object './fentry_test_kern.o'
failed -1981019360

BTF: .tmp_vmlinux.btf: pahole (pahole) is not available
Failed to generate BTF for vmlinux
Try to disable CONFIG_DEBUG_INFO_BTF
Makefile:1106: recipe for target 'vmlinux' failed

sudo apt install dwarves

```


### 27/5/2020
- trampoline functionality seems interesting 
- https://www.spinics.net/lists/netdev/msg626011.html new type of bpf extensions amirite?
- simple fentry https://elixir.bootlin.com/linux/v5.7-rc4/source/tools/testing/selftests/bpf/progs/test_trampoline_count.c
- https://elixir.bootlin.com/linux/v5.7-rc4/source/tools/testing/selftests/bpf/progs/freplace_connect4.c


### 22/5/2020
- finally fixed the kernel compilation
- compiled with LSM BPF support in general config options
- updated the headers and not out of tree build for 5.7 compiles again
- hellotrace compiles again but I need to see where the trace print ends
- added strtol for tracing functions and now I'm back to the old situation with override
- the initial iterations are more likely to succeed regardless of the size, and subsequent ones are more prone to failure

### 20/5/2020
- I think adding the flag -lz fixed that, now I'm back to undefined reference to read_trace_pipe
- following the indication in the bpf compilation trace from the kernel, I basically just built including the trace_helpers
- https://fosdem.org/2020/schedule/event/endless_network_programming/attachments/slides/3663/export/events/attachments/endless_network_programming/slides/3663/FOSDEM20_QMO_eBPF_update.pdf
- do I have to convert to btf? https://lore.kernel.org/bpf/20191102220025.2475981-5-ast@kernel.org/
- https://lore.kernel.org/bpf/20191102220025.2475981-6-ast@kernel.org/


### 17/5/2020
- fixed that dependency, it was an issue in my script
- going on fixing dependencies. Now I have the zlib problem again but it's not working even compiling against kernel source

### 16/5/2020
- did some writing for the thesis

### 14/5/2020
- meeting with bpf office hour, they advised to go for fentry fexit and use modify return with that

### 13/5/2020
- tried to fix new compilation setup
- had to modify the test_attr__enabled macro in perf-sys
- still missing the asm/types.h in the compilation
- collected traces from samples compilation in the kernel to have all the includes

### 12/5/2020
- had to undo some stuff cause the new build didn't work
- currently working, I am rebuilding new infrastructure on new kernel although rc5 is already there, but shouldn't change much
- doing scripting for automated rebuild of bpf headers as needed

### 7/5/2020
- weekly meeting, I need to both dig in the reasons why override return doesn't work and test the new one
- try to be ready for next week's bpf office hour

### 6/5/2020
- got an answer from the mailing list, very obscure so idk
- testing to see if multiple cpus make a difference. They do in the sense that the multiple cpus male it more reliable wow
- Alexey suggested to have a look at the latest kernel version for bpf_modify_return but it's in the release cycle for the next kernel
- not ideal cause my guess is the 5.7 release is a month ahead
- https://github.com/torvalds/linux/blob/master/tools/testing/selftests/bpf/progs/modify_return.c
- https://github.com/torvalds/linux/commit/3d08b6f29cf33aeaf301553d8d3805f0aa609df7
- https://github.com/torvalds/linux/commit/da00d2f117a08fbca262db5ea422c80a568b112b
- https://elixir.bootlin.com/linux/v5.7-rc4/ident/bpf_modify_return_test
- https://elixir.bootlin.com/linux/v5.7-rc4/source/net/bpf/test_run.c
- https://lwn.net/Articles/813724/
- looks actually very promising if it allows for side effect prevention and can take the params of the original function

### 5/5/2020
- the proc file system access does not fail, I think it could depend on the fact that there's no IO involved
- need to try using a device driver that performs actual I/O from a file
- getting massive amounts of timestamps, but very sweet, I need to redo all measurements with unsigned long long
- https://elixir.bootlin.com/linux/v5.4/source/kernel/time/timekeeping.c#L451 
- __ktime_get_fast_ns timing function that i'm using
- also put timestamp on return from copyout to see if there is a significant footprint for failures

### 3/5/2020
- fixed the bpf part, predictably the error doesn't show, I think the problem is with actual IO
- reading the linux device drivers to write a kernel module to access a real device
- maybe scull shar device, with own file operations on top?
- use my code on a non IO based device (dev null? dev urand?) and show that in that case it doesn't fail vs in mine it does
- measure file IO with iostat
- increase buffer size to 4096 for the proc file to see if there is any difference, my guess is there's not cause there's no IO happening

### 2/5/2020
- fixed the module to do the read in the way I want
- size is still 512, migght have to increase to replicate behavior
- todo, put all in a read cycle and complete kprobe behavior with override return

### 1/5/2020
- meeting, discussed about the strategy to reproduce the error for mailing list
- created kernel module for proc file system

### 30/4/2020
- sent help request to the linux kernel mailing list

### 27/4/2020
- recompiled kernel to include timestamps, want to plot to see if there is a pattern in execution order
- tail -f /var/log/kern.log
- graphed the time differences cached vs uncached 

### 26/4/2020
- digging deeper into influence of cache for my copyout case
- look at the original functions that can be injected, do they have any characteristic?
- https://kinvolk.io/blog/2018/02/timing-issues-when-using-bpf-with-virtual-cpus/
- https://github.com/weaveworks/scope/issues/2650
- could it have something to do with the virtual cpu?
- try to put timestamps on kprobe and on copyout actual function call to see if there is any discrepancy, 
- look for way to print the cpu core where i'm executing to find out if there is some correlation
- investigate actual IO throughput with iostat


### 25/4/2020
- added print in copyout, the numbers match 
- the  kprobe is always executed but sometimes it is not the right order
- https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-system-programming-manual-325384.pdf
- intel manual lfence mfelse sfence page 273. can try this for instruction ordering
- alternative strategy would be to extend the iov iter with negative number semantics for my use case and see if it is solved
- I will try both in this order, they can build on top of each other
- https://hadibrais.wordpress.com/2019/02/26/the-significance-of-the-x86-sfence-instruction/
- mb rmb wmb
- https://www.kernel.org/doc/Documentation/memory-barriers.txt
- https://stackoverflow.com/questions/30236620/what-is-wmb-in-linux-driver
- https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html


### 24/4/2020
- digging in iostat
- 

```
echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches

Device            r/s     w/s     rkB/s     wkB/s   rrqm/s   wrqm/s  %rrqm  %wrqm r_await w_await aqu-sz rareq-sz wareq-sz  svctm  %util
loop0            0.00    0.00      0.00      0.00     0.00     0.00   0.00   0.00    0.00    0.00   0.00     0.00     0.00   0.00   0.00
loop1            0.00    0.00      0.00      0.00     0.00     0.00   0.00   0.00    0.00    0.00   0.00     0.00     0.00   0.00   0.00
loop2            0.00    0.00      0.00      0.00     0.00     0.00   0.00   0.00    0.00    0.00   0.00     0.00     0.00   0.00   0.00
vda             27.00    0.00   1036.00      0.00    93.00     0.00  77.50   0.00    0.19    0.00   0.00    38.37     0.00   1.04   2.80

```

### 23/4/2020
- working on the new prog type BPF_PROG_TYPE_KPROBE_OFFLOAD
- looking at linux kernel to understand what should be modified
- initial strategy could be to just modify access permissions for kprobes, but eventually i'd rather extend
- different options can be to create a parallel type altogether that does not actually follow kprobe but I need to understand how the attach type works

### 22/4/2020
- explore mmap call stack
- https://elixir.bootlin.com/linux/v5.4/source/fs/ext4/file.c#L520 file operations
- https://elixir.bootlin.com/linux/v5.4/source/fs/ext4/file.c#L369 ext4_file_mmap
- https://elixir.bootlin.com/linux/v5.4/source/fs/ext4/file.c#L363 ext4_file_vm_ops
- https://elixir.bootlin.com/linux/v5.4/source/mm/filemap.c#L2623 filemap_map_pages
- ok let me just put this in the backlog, requires more in depth


### 19/4/2020
- it looks like the longer the program, the more it will fail
. if i iterate a handful of times I always succeed
- if I itterate 20 times I start to see some failures
- if I iterate 100 times even more so
- good until 100 times if I avoid all the exponential buffer increase, and only focus on the 4096 size pages
- with 1000 it starts to be iffy

```
buffer on user side = 94726941235312
---------------------------------------------------------
rand size : 4096
success: 366
failed: 634
---------------------------------------------------------
buffer on user side = 94726941235312
---------------------------------------------------------
known size : 4096
success: 0
failed: 1000
---------------------------------------------------------

```

### 18/4/2020
- trying to figure out the actual behavior of the override
- I went from having 100% override success (reported in the trace) to basically 0% success, something is wrong
- read write from random file is less successful, at least so it seems, but I need to ensure it is actually not reading elsewhere
- read from known file doesn't seem to work although it used to give the opposite result of not overriding on small reads, overriding on big ones. 
- check if it depends on the size of the program, I suspect a lot of reordering happening and bpf being called somewhat differently

### 17/4/2020
- read the paper about performance measurement

### 16/4/2020
- wrote thesis proposal

### 10/4/2020
- maybe the one i'm getting now is just an llvm warning and the compilation succeeded anyway
- http://llvm.org/viewvc/llvm-project/llvm/trunk/lib/Target/BPF/BPFRegisterInfo.cpp?view=markup&pathrev=292180 line 45
- http://llvm.org/viewvc/llvm-project/llvm/trunk/test/CodeGen/BPF/warn-stack.ll?view=markup&pathrev=292180
- http://lists.llvm.org/pipermail/llvm-commits/Week-of-Mon-20170116/420316.html
- https://medium.com/@phylake/bottom-up-ebpf-d7ca9cbe8321
- testing framework https://lwn.net/Articles/718784/
- verifier explanation https://books.google.nl/books?id=jtS-DwAAQBAJ&pg=PA11&lpg=PA11&dq=what+happens+bpf+kprobe+call&source=bl&ots=W6Ujnuoeks&sig=ACfU3U2O3ZuHTmIkNSbOCFw_GVMP4ug5zw&hl=en&sa=X&ved=2ahUKEwj_udP6yd3oAhWGLewKHTW8ARQQ6AEwAnoECAwQKQ#v=onepage&q=what%20happens%20bpf%20kprobe%20call&f=false
- https://cacm.acm.org/magazines/2018/7/229031-always-measure-one-level-deeper/fulltext


### 9/4/2020
- I tried to benchmark. In the script it turns out that the normal program is usually faster (why?)
- I tried to reduce the number of calls to bpf probe read
- it does lower the times on average, so it's not good to use it per number
- Recompiled the kernel with higher bPf max size so I can hopefully read the whole buffer at once (not I'm doing it 16 times)
- https://elixir.bootlin.com/linux/v5.4/ident/MAX_BPF_STACK
- https://github.com/iovisor/bpftrace/issues/305
- https://github.com/iovisor/bpftrace/blob/master/docs/internals_development.md


### 5/4/2020
- examining the verifier to figure out a way to access from buffer, possibly read only for now just to avoid corruptions
- there are prf prog types that have the possibility to access packet content
- need to include/extend the verifier to allow that for my bpf prog type
- this would probably be a good moment to move away from kprobes but hey
- https://elixir.bootlin.com/linux/v5.4/source/kernel/bpf/verifier.c#L198 bpf_call_arg_meta
- https://elixir.bootlin.com/linux/v5.4/source/kernel/bpf/verifier.c#L2238 may access direct pkt data I think I need this
- but it is called only if reg_is_pkt_pointer which I don't think it's my case
- https://elixir.bootlin.com/linux/v5.4/source/kernel/bpf/verifier.c#L899
- need to tweak check mem access https://elixir.bootlin.com/linux/v5.4/source/kernel/bpf/verifier.c#L2748

### 4/4/2020
- with long buffers I think that is is not executed speculatively/parallelized. If I read 256 I almost always manage to avoid the copy
- stack limit is 512 for bpf programs so I need to move the ubuff to a map, percpu map array, to read more than that
- https://lwn.net/Articles/671399/
- https://lwn.net/Articles/674443/
- floating point numbers not supported yet so the average is returned as an integer
- I timed executions and good news is performance is approximately the same
- this means that if I can avoid the copy (need access to the from buffer in the ctx) I will improve by a whole lot

### 3/4/2020
- Recompiling the kernel switching likely and unlikely statements to see if I can detect any change
- I don't see how that should be the case cause copyout would have been triggered anyway so it just masks my problem
- https://software.intel.com/sites/default/files/managed/9e/bc/64-ia-32-architectures-optimization-manual.pdf
- ERMSB enables fast string copy, is it affecting me somehow? what is that specifically?
- https://stackoverflow.com/questions/43343231/enhanced-rep-movsb-for-memcpy
- https://elixir.bootlin.com/linux/v5.4/source/arch/x86/include/asm/uaccess_64.h#L28
- http://alumni.cs.ucr.edu/~tianc/publications/pldi10.pdf
- https://www.kernel.org/doc/html/v4.17/userspace-api/spec_ctrl.html


### 2/4/2020
- https://elixir.bootlin.com/linux/v5.6/source/include/uapi/linux/bpf.h
- kernel 5.6 is out and I'm having a look at the new helper functions

### 29/3/2020
- researched on ways to test if issue comes from SE
- moved the override return upward in the instrumentation
- disabling speculative exec (I think) with grub modification settins 
```
mds=full,nosmt
```
- https://wiki.ubuntu.com/SecurityTeam/KnowledgeBase/MDS
- https://github.com/torvalds/linux/blob/master/Documentation/admin-guide/kernel-parameters.txt
- tail call works but doesn't seem to support override return, that's the only instruction that fails
- tail call doesn't return to caller and doesn't share namespace
- need to figure out if there's some other way to call custom functions, or to allow tail call to call override

### 28/3/2020
- I rewrote the printk verifier following more strictly the example of bpf strtol to see how char * is handled.
- passes the verifier but prints rubbish, it's something yo!

```
dmesg
[  296.496371] \x80u&\x90\xff\xff\xff\xff
```
- it SOMEHOW worked once and returned -1 and I could read 42 on the buffer
- if I add a printk before override return with the len it works, which means it doesn't work for me

```
sudo ./readiter 
eBPF file to be loaded is : ./readiter_kern.o 
buffer on user side = 94365040205184
retval = -1
avg = 2, on buffer 42
```
or also
```
eBPF file to be loaded is : ./readiter_kern.o 
buffer on user side = 94339293543776
retval = 10
avg = 2, on buffer 42

loaded module OK.
Check the trace pipe to see the output : sudo cat /sys/kernel/debug/tracing/trace_pipe 
```
- sometimes it looks like it's entering real copyout (not directly linked with the failure case, so there must be some weird thing going on)
- understanding the semantics of copyout inside copy_iov_to_iter. it's copying 60 bytes and copyout will loop on that until there are no bytes left
- trying to return that value
```
<...>-5733  [001] ....  4383.221691: 0: copy_page_to_iter_iovec, bytes 60
```
- ok now it does work SOMETIMES, meaning that I read the 9 as return value and the buffer is not overwritten by the real one.
- the question is how to make it work reliably. 
- the copyout is supposed to return 0 on success, so that's what I have to return not to make it loop endlessly
- I removed the parallel path to real copyout from the iov_copy function to eliminate noise (commit da6939ea2cdb91252ded501c47527a2d1db68711)

- I think it's speculative exec. For now my return value equals to the success one to basically I am fitting the right branch prediction if the speculative exec is copying in advance
- https://www.golinuxhub.com/2018/01/how-to-disable-or-enable-hyper.html

### 26/3/2020
- instead of editing the whole semantics, for now I return the correct size value and pass the info on the map

### 25/3/2020
- recompiling with some debug prints and custom print dmesg helper
- the custom dmesg printk doesn't pass the verifier for whatever reason
- nice overview of the read path http://www.cs.utah.edu/~xinglin/blog/read-syscall-implementation-in-linux-kernel/
- I will try to override return of the ksys_read

```
286: (85) call bpf_dmesg_print#113
kernel subsystem misconfigured func bpf_dmesg_print#113
processed 255 insns (limit 1000000) max_states_per_insn 0 total_states 13 peak_states 13 mark_read 10

```

- override return on ksys_read works, but all the subsequent calls are hijacked and the call doesn't go down the read path
- this is good in the sense that it immediately allows copyout to not happen if I have the result already, but it is bad cause the return value semantics for copyout is not so easy to fit to my use case

```
eBPF file to be loaded is : ./readiter_kern.o 
buffer on user side = 94084773690560
retval = 1
avg = 0, on buffer 
loaded module OK.
Check the trace pipe to see the output : sudo cat /sys/kernel/debug/tracing/trace_pipe 

trace_pipe:
        readiter-2013  [002] ....   474.229227: 0: ksys_read 9
```
- https://elixir.bootlin.com/linux/v5.4/source/samples/bpf/sockex3_user.c
- https://elixir.bootlin.com/linux/v5.4/source/samples/bpf/tracex5_kern.c#L34
- tail call is not yet working but I think I am just missing some adjustment on user side like here
- the problem is 

### 22/3/2020
- no it didn't fail, I just hadn't completed the upgrade procedure
- the call works now, but does not behave as I was hoping, propagating all the way to the user
- checking the source code of the function that calls copyout, it does loop till the return of copyout equals the buffer size so I'm actually at tisk of stalling the system if I return a negative value, I think
- I need to personalize the semantics in the whole read path so that it is propagated in the right way
- todo: investigate the file (/linux/)tools/include/uapi/linux/bpf.h cause it has helper copies but not updated with mine, maybe I need that too
- trying to add custom print helper

### 21/3/2020
- added map to communicate result to userspace
- https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=4b1a29a7f5425d32640b34b8a755f34e02f64d0f
- not all functions appear to be erro injectable, based on this commit
- find the list of injectable functions, find how to extend that
- if I can highjack the return, I can avoid the buffer copy altogether cause the function is highjacked and not called
- as of now probe write user is not working from kernel to user, cause the to buffer is overwritten by the actual call to copyout
- https://elixir.bootlin.com/linux/v5.4/ident/ALLOW_ERROR_INJECTION 
- need to recompile with that macro set to copyout bpf, allowing probably errno_null
- recompiled with error injection in copyout?bpf, still fails

```
eBPF file to be loaded is : ./readiter_kern.o 
ioctl PERF_EVENT_IOC_SET_BPF failed err Invalid argument
```

### 20/3/2020
- tried to understand the actual read path. Problem is that I don't think I can override return at any point before copyout
- tomorrow try to call that in kretprobe
- does that only work when there's a chance to set errno? Cause in theory it is for error injection

### 19/3/2020
problems at this point:
- find a way to link (and potentially chain) different instrumentation. Probably possible to do with bpf_tail call, with a constant hook point (copyout) and the tail calls being called according to user needs
- unsigned/signed  division
- how to share data type and format
- how to overwrite return value
- stop the data copy on the way back
- https://www.kernel.org/doc/html/latest/bpf/bpf_design_QA.html
- examining override return commit https://github.com/torvalds/linux/commit/965de87e54b803223bff703ea6b2a76c056695ae
- https://elixir.bootlin.com/linux/v5.4/source/arch/x86/lib/error-inject.c#L17 error inject
- overriding rax value https://elixir.bootlin.com/linux/v5.4/source/arch/x86/include/asm/ptrace.h#L112
- https://elixir.bootlin.com/linux/v5.4/source/samples/bpf/bpf_load.c#L255 fails here for me 
- I-m overriding the return of copyout, how is that propagated to the actual read?? most likely not just passed by

```
eBPF file to be loaded is : ./readiter_kern.o 
ioctl PERF_EVENT_IOC_SET_BPF failed err Invalid argument
```

### 18/3/2020
commit ab6116ed8cf20e22d6c78ffe85decb0637571f33
- now trying strtoul, had to recompile the kernel because I had changed an arg type
- WORKS
```
readiter-2170  [000] d...   244.808086: 0: copyout char 01 converted to 1
readiter-2170  [000] d...   244.808087: 0: copyout char 02 converted to 2
readiter-2170  [000] d...   244.808087: 0: copyout char 03 converted to 3
readiter-2170  [000] d...   244.808088: 0: sum of numbers is 6, avg is 2
```
----------------------------------------------------------------------------------------
commit 4e914ce680d6d87e39e7a5e618aa3720fd6e98d8q

- now I am porting the strtol piece of code to the readiter function, to try to parse the numbers that I read from file
- IT WORKS
```
readiter-21940 [002] .N.. 26752.619260: 0: full buffer 01 02 03
readiter-21940 [002] .N.. 26752.619263: 0: copyout char 01 converted to 1
readiter-21940 [002] .N.. 26752.619264: 0: copyout char 02 converted to 2
readiter-21940 [002] .N.. 26752.619264: 0: copyout char 03 converted to 3
readiter-21940 [002] .N.. 26752.619265: 0: sum of numbers is 6
```
- trying to operate with numbers. signed division does not appear to be supported 

```
making ...readiter
Error: Unsupport signed division for DAG: 0x560db1216cc8: i64 = sdiv 0x560db1214c40, Constant:i64<3>Please convert to unsigned div/mod.
```

---------------------------------------------------------------------------------------------------------------

commit ca5e06b33f90dc5ba9803ae889f87e57d185ad2c
- now I am at the step of debugging the actual kstrtol function. getting invalid stack type error that I originally had
- checking to see if it is a problem with my usage pattern that is considered unsafe. 
- important, it is not the wrong type anymore, this is an offset error so totally looks like something that the verifier expects me rto check

```
11: (85) call bpf_kstrtol#111
invalid stack type R1 off=-4 access_size=10
processed 12 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0

```
- as I heard in the conference from fosdem https://fosdem.org/2020/schedule/event/debugging_bpf/
- IT DOES PASS THE TEST (but doesn't print). It was considerind 10 to be the size of the buffer although in theory it is the base in kstrtol. will now try with standard bpf_strtol
- AAAAAAH IT WORKS. (with bpf_strtol). The num needs to be initialized to a default value or the verifier will complain for risky memory access

```
invalid indirect read from stack off -16+0 size 8
processed 11 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0

```
-------------------------------------------------------------------------------------------------------------

commit 8ef272415a046699ad9b6f57a787bffe11d56e34
- debugging strtol program, now the first verifier error is gone
- it was a problem with the printk function, not getting invalid relo[] anymore but printk definitely is kinda broken 
```
          strtol-18652 [000] d... 21678.730965: 0: converted num to int 42 from 42
�X:�@O���%!{������p:�����;�@

```


### 15/3/2020
- started looking at commit history in the verifier to understand what changed


### 13/3/2020
- investigate the reason for failure in normal arg_ptr_to_mem case
- hm it doesn't really work
- when I isolate and only instrument that call, in strtol_kern.c, the error is the following
- llvm-objdump -d -r -print-imm-hex sample.o
- wrote a kernel module to double check that the kstrtol is used correctly. It works so this narrows the chances of error
- it is either in the compiler for the bytecode generation of strtol helper
- or it is in the verifier for the type propagation and formal verification

```
invalid relo for insn[2] no map_data match
bpf_load_program() err=22
fd 0 is not pointing to valid bpf_map
processed 0 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
fd 0 is not pointing to valid bpf_map
processed 0 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0

```

### 12/3/2020
- recompiled with header parameter set to arg_dontcare
- doesn't work
- investigating the kernel misconfiguration error, gotta start somewhere
- todo afterwards, investigate the helper function check. I think the error is in type propagation in the formal verification step.
- check syntax but that looks all right. Try to load kernel module with kstrtol idk

```
6: (85) call bpf_kstrtol#111
kernel subsystem misconfigured func bpf_kstrtol#111

```

### 11/3/2020
- trying to compile the kernel with a harmless helper function to see how the verifier behaves in that case
- normal function that just prints to user does work and passes the verifier
- this means that my procedure to add verifiers is correct and the issue with the other functions is indeed in the formal verification
- try to use ARG_DONTCARE to avoid the big helper verification step


### 7/3/2020
- https://elixir.bootlin.com/linux/v5.4/source/kernel/bpf/verifier.c#L3225
- https://elixir.bootlin.com/linux/v5.4/source/kernel/trace/bpf_trace.c#L765
- https://elixir.bootlin.com/linux/v5.4/source/include/linux/bpf.h#L305
- https://elixir.bootlin.com/linux/v5.4/source/kernel/bpf/cgroup.c#L812
- I think the fail happens in check_func_arg. I need to understard what goes differently between the prev and actual 
- probably gets called by this helper check routine https://elixir.bootlin.com/linux/v5.4/source/kernel/bpf/verifier.c#L3940 
- tried to instrument kprobe on the verifier function and the error changes to this, weird
- I think that I should deep dive in the verifier to understand what happens, and what data structures are necessary
- according to https://blogs.oracle.com/linux/notes-on-bpf-5 this fail is in the second step of the verifier, when all states are being tested
- https://elixir.bootlin.com/linux/v5.5/source/kernel/bpf/helpers.c#L437 found the function in 5.5
- manpages are in /include/uapi/linux/bpf.h
- side by side of selftest example and the compiled code don't look that different but hey, not the problem is the map error anyway. Something is wrong.

```
invalid relo for insn[5] no map_data match
bpf_load_program() err=22
fd 0 is not pointing to valid bpf_map
processed 0 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
fd 0 is not pointing to valid bpf_map
processed 0 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0

```

```
bpf_prog7:
       0:	b7 01 00 00 2a 00 00 00 	r1 = 0x2a
       1:	7b 1a f8 ff 00 00 00 00 	*(u64 *)(r10 - 0x8) = r1
       2:	bf a4 00 00 00 00 00 00 	r4 = r10
       3:	07 04 00 00 f8 ff ff ff 	r4 += -0x8
       4:	00 00 00 00 00 00 00 00 00 00 	r1 = 0x0 ll
		0000000000000020:  R_BPF_64_64	.L.str
       6:	b7 02 00 00 08 00 00 00 	r2 = 0x8
       7:	b7 03 00 00 0a 00 00 00 	r3 = 0xa
       8:	85 00 00 00 69 00 00 00 	call 0x69
       9:	b7 00 00 00 00 00 00 00 	r0 = 0x0
      10:	95 00 00 00 00 00 00 00 	exit


/* arg1 (buf) */
			BPF_MOV64_REG(BPF_REG_7, BPF_REG_10),
			BPF_ALU64_IMM(BPF_ADD, BPF_REG_7, -8),
			/* " -6\0" */
			BPF_MOV64_IMM(BPF_REG_0,
				      bpf_ntohl(0x0a2d3600)),
			BPF_STX_MEM(BPF_W, BPF_REG_7, BPF_REG_0, 0),

			BPF_MOV64_REG(BPF_REG_1, BPF_REG_7),

			/* arg2 (buf_len) */
			BPF_MOV64_IMM(BPF_REG_2, 4),

			/* arg3 (flags) */
			BPF_MOV64_IMM(BPF_REG_3, 10),

			/* arg4 (res) */
			BPF_ALU64_IMM(BPF_ADD, BPF_REG_7, -8),
			BPF_STX_MEM(BPF_DW, BPF_REG_7, BPF_REG_0, 0),
			BPF_MOV64_REG(BPF_REG_4, BPF_REG_7),

			BPF_EMIT_CALL(BPF_FUNC_strtol),
```

### 6/3/2020
- recompiled the kernel adding a kstrtol helper function for bpf
- found useful reference for bpf helpers
- https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md
- recompiled to allow pointer to ARG_ANYTHING cause I was having the same issue as before, but now the problem is this
- ok the way to go now is definitely to try to compile the selftest and compare the opcodes
- I am not sure if it is an issue witl clang missing an init?

```
22: (85) call bpf_strtol#105
kernel subsystem misconfigured func bpf_strtol#105
processed 19 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0

```

### 4/3/2020
- trying to copy cgroup sample from kernel and add a random strtol to test if it is working there
- looking at the mailing list for the patch that introduced the helpers, they look as if they are supposed to be used just for one cgroup type
- https://lkml.org/lkml/2019/4/6/139
- however no reason to believe that once I allow the helper somewhere else the verifier should fail. in the proto definition the arg1 type is a pointer to memory, why do I have an error given that it is a pointer to memory and it expects a map instead??
- https://elixir.bootlin.com/linux/v5.4/source/tools/testing/selftests/bpf/test_cgroup_storage.c#L69
https://elixir.bootlin.com/linux/v5.4/source/tools/testing/selftests/bpf/test_sysctl.c#L64 BPF instructions calling that function
- I will try to write a raw bpf instruction sequence to call strtol
- apt-get install gcc-multilib libc6-i386 libc6-dev-i386 for selftests
- https://www.kernel.org/doc/html/latest/bpf/bpf_devel_QA.html#q-samples-bpf-preference-vs-selftests



``` 
const struct bpf_func_proto bpf_strtol_proto = {
	.func		= bpf_strtol,
	.gpl_only	= false,
	.ret_type	= RET_INTEGER,
	.arg1_type	= ARG_PTR_TO_MEM,
	.arg2_type	= ARG_CONST_SIZE,
	.arg3_type	= ARG_ANYTHING,
	.arg4_type	= ARG_PTR_TO_LONG,
};


sudo ./readiter 
eBPF file to be loaded is : ./readiter_kern.o 
ioctl PERF_EVENT_IOC_SET_BPF failed err Invalid argument
``` 
### 1/3/2020
- worked on the presentation

### 29/2/2020
- checking if I can now use the bpf helper I need to convert strtol
- so now the code seems to find the right helper function but the verifier still fails with this error
- trying to understand how to use cgroups so I can first test the helper function in the original env, to understand if it is a problem of my kernel extension of of me not knowing how to use it (most likely)
- in the meantime also testing override return to see if the return value of the read can be made to be what I want. I saw that it does not happen in kretprobe so that's good since I can only hook one point at a time
- guess what it doesn't work cause I have to recompile with an explicit flag in the config file CONFIG_BPF_KPROBE_OVERRIDE
- https://elixir.bootlin.com/linux/v5.4/source/samples/bpf/tracex7_kern.c
- https://elixir.bootlin.com/linux/v5.4/source/kernel/trace/bpf_trace.c#L755


``` 
bpf_load_program() err=13
...
R1 type=map_ptr expected=fp
processed 21 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
```

### 28/2/2020
- I worked to set up the new VM with more resources
- wrote the guide file to repeat it one day, if needed
- I might need to update the local headers to accomodate the bpf helpers that I am adding now
- I am compiling the userspace bpf samples linking with the libbpf in kernel tree rather than the external one, because the mirror github uses an outdated version of zlib (gzopen64@@ZLIB_1.2.3.3) while the in-kernel links to libz.so.1.2.11, which is the one I have in /lib/x86_64-linux-gnu/ 

### 27/2/2020
- I tested bpf_probe_read_str. it appears to work differently than probe read because it attaches a newline
- this avoids the overflow with the format string. now I'm trying to convert the char[] to int
- kstrtol() should do but I think the verifier complains (at JIT time) for a jump out of range. Am I allowed to call that function in bpf code?
- if not, I have to recompile with a helper T_T 
- bpf_strtol exists ooooh https://patchwork.kernel.org/patch/10887787/
- aand of course it doesn't work. It doesn't find the symbol. In fact I checked the kprobe function protos and it's not in the allowed ones so I need to recompile including that one https://elixir.bootlin.com/linux/v5.4/source/kernel/trace/bpf_trace.c#L687
- https://elixir.bootlin.com/linux/v5.4/source/kernel/bpf/helpers.c#L452

```
invalid relo for insn[131].code 0x85
bpf_load_program() err=22
jump out of range from insn 53 to 151
processed 0 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0


132: (85) call bpf_strtol#105
unknown func bpf_strtol#105
processed 112 insns (limit 1000000) max_states_per_insn 0 total_states 5 peak_states 5 mark_read 3

```

### 26/2/2020
- tried to understand perf array because bpf printk definitely is too iffy to understand what's going on
- read through the verifier code (partially) to understand how the kprobe read only is enforced
- finished reading the oravle blogs on skb, definitely what I will need in the long run

### 22/2/2020
- studied the blogs of Oracle on bpf
- https://blogs.oracle.com/linux/notes-on-bpf-1
- I think I need to investigate the skb infrastructure cause it appears to have functions that can be ported to storage almost as is, for my functionality


### 20/2/2020
- trying to loop through int numbers in the instrumentation
- printk behaves in a weird way, looks like it is not flushed or something
- 

```
           <...>-3846  [002] ....  1282.081987: 0: ext4 file read
           <...>-3846  [002] ....  1282.082028: 0: generic file read
           <...>-3846  [002] ....  1282.082034: 0: copy_page_to_iter
           <...>-3846  [002] ....  1282.082037: 0: copy_page_to_iter_iovec
           <...>-3846  [002] ....  1282.082051: 0: entering modified copyout
           <...>-3846  [002] ....  1282.082054: 0: buffer on params 94337010364880, buffer on map 94337010364880
           <...>-3846  [002] ....  1282.082059: 0: copyout to 0x00000000fd0daf3f, ul 94337010364880 len 30
           <...>-3846  [002] ....  1282.082069: 0: full buffer 
           <...>-3846  [002] ....  1282.082079: 0: copyout to 0x00000000fd0daf3f from 0x000000006aff2d09 char 01full buffer %s

           <...>-3846  [002] ....  1282.082089: 0: copyout to 0x00000000fd0daf3f from 0x000000006aff2d09 char 02full buffer %s

           <...>-3846  [002] ....  1282.082097: 0: copyout to 0x00000000fd0daf3f from 0x000000006aff2d09 char 03full buffer %s

           <...>-3846  [002] ....  1282.082108: 0: copyout to 0x00000000fd0daf3f from 0x000000006aff2d09 char 04full buffer %s

           <...>-3846  [002] ....  1282.082115: 0: copyout to 0x00000000fd0daf3f from 0x000000006aff2d09 char 05full buffer %s

           <...>-3846  [002] ....  1282.082122: 0: copyout to 0x00000000fd0daf3f from 0x000000006aff2d09 char 06full buffer %s

           <...>-3846  [002] ....  1282.082130: 0: copyout to 0x00000000fd0daf3f from 0x000000006aff2d09 char 07full buffer %s

           <...>-3846  [002] ....  1282.082181: 0: copyout to 0x00000000fd0daf3f from 0x000000006aff2d09 char 08full buffer %s

           <...>-3846  [002] ....  1282.082191: 0: copyout to 0x00000000fd0daf3f from 0x000000006aff2d09 char 09full buffer %s

           <...>-3846  [002] ....  1282.082199: 0: copyout to 0x00000000fd0daf3f from 0x000000006aff2d09 char 10full buffer %s

```

### 19/2/2020
- recompiled kernel again with a few more printks because turns out I don't go through the atomic mapped part but the one below
- created version that uses mmap
- fixed probe_read, now I can access the buffer
- The size of the read in userspace must be exactly the size of the buffer in kernel through which I perform the read
- it's still gonna copy so not sure if there is any gain from this as of now
- doing a dynamic size based on the parameter read through context causes llvm to fail compilation

```
        <...>-3298  [002] ....  4349.402961: 0: ext4 file read
           <...>-3298  [002] ....  4349.402969: 0: generic file read
           <...>-3298  [002] ....  4349.402971: 0: copy_page_to_iter
           <...>-3298  [002] ....  4349.402971: 0: copy_page_to_iter_iovec
           <...>-3298  [002] d...  4349.402975: 0: entering modified copyout
           <...>-3298  [002] d...  4349.402975: 0: buffer on params 94628466936176, buffer on map 94628466936176
           <...>-3298  [002] d...  4349.402976: 0: copyout to 0x00000000f9d0a370, ul 94628466936176 len 41
           <...>-3298  [002] d...  4349.402979: 0: copyout to 0x00000000f9d0a370 from 0x00000000c35b7d33 char 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17yp

-----------------------------------
making ...readiter
LLVMSymbolizer: error reading file: No such file or directory
#0 0x00007fdcfd23f0ea llvm::sys::PrintStackTrace(llvm::raw_ostream&) (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0x81e0ea)
#1 0x00007fdcfd23d366 llvm::sys::RunSignalHandlers() (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0x81c366)
#2 0x00007fdcfd23d49b (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0x81c49b)
#3 0x00007fdcfc2e5f20 (/lib/x86_64-linux-gnu/libc.so.6+0x3ef20)
#4 0x00007fdcfd81382c llvm::SelectionDAG::getGlobalAddress(llvm::GlobalValue const*, llvm::SDLoc const&, llvm::EVT, long, bool, unsigned char) (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0xdf282c)
#5 0x00007fdcfe8c1ab6 llvm::BPFTargetLowering::LowerGlobalAddress(llvm::SDValue, llvm::SelectionDAG&) const (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0x1ea0ab6)
#6 0x00007fdcfd72b751 (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0xd0a751)
#7 0x00007fdcfd72ee38 llvm::SelectionDAG::Legalize() (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0xd0de38)
#8 0x00007fdcfd836bf8 llvm::SelectionDAGISel::CodeGenAndEmitDAG() (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0xe15bf8)
#9 0x00007fdcfd8403fc llvm::SelectionDAGISel::SelectAllBasicBlocks(llvm::Function const&) (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0xe1f3fc)
#10 0x00007fdcfd842905 (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0xe21905)
#11 0x00007fdcfd4e3fe0 llvm::MachineFunctionPass::runOnFunction(llvm::Function&) (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0xac2fe0)
#12 0x00007fdcfd3197f8 llvm::FPPassManager::runOnFunction(llvm::Function&) (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0x8f87f8)
#13 0x00007fdcfd319843 llvm::FPPassManager::runOnModule(llvm::Module&) (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0x8f8843)
#14 0x00007fdcfd31908f llvm::legacy::PassManagerImpl::run(llvm::Module&) (/usr/lib/llvm-6.0/bin/../lib/libLLVM-6.0.so.1+0x8f808f)
#15 0x000055c373262861 (llc+0x21861)
#16 0x000055c3732575d5 (llc+0x165d5)
#17 0x00007fdcfc2c8b97 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.6+0x21b97)
#18 0x000055c37325775a (llc+0x1675a)
Stack dump:
0.	Program arguments: llc -march=bpf -filetype=obj -o compiled/readiter_kern.o 
1.	Running pass 'Function Pass Manager' on module '<stdin>'.
2.	Running pass 'BPF DAG->DAG Pattern Instruction Selection' on function '@bpf_prog7'
./make.sh: line 7:  3609 Done                    clang -nostdinc -isystem `clang -print-file-name=include` -D__KERNEL__ -D__ASM_SYSREG_H -D__TARGET_ARCH_x86 $C_FLAGS -Icommon/ -include /usr/src/linux-headers-`uname -r`/include/linux/kconfig.h -I/usr/src/linux-headers-`uname -r`/include/ -I/usr/src/linux-headers-`uname -r`/include/uapi/ -I/usr/src/linux-headers-`uname -r`/include/generated/uapi/ -I/usr/src/linux-headers-`uname -r`/arch/x86/include -I/usr/src/linux-headers-`uname -r`/arch/x86/include/uapi/ -I/usr/src/linux-headers-`uname -r`/arch/x86/include/generated/ -I/usr/src/linux-headers-`uname -r`/arch/x86/include/generated/uapi/ -I/usr/src/linux-headers-`uname -r`/tools/lib/ -include asm_goto_workaround.h -O2 -emit-llvm -c "$KERN".c -o -
      3610 Segmentation fault      (core dumped) | llc -march=bpf -filetype=obj -o "compiled/$KERN".o
```

### 16/2/2020
- trying to use probe write user with reduction of buffer size
- without changing the size param as well, the write also dumps some nonsense bytes at the end. (makes sense, problem for security)
- https://stackoverflow.com/questions/43003805/can-ebpf-modify-the-return-value-or-parameters-of-a-syscall
- kprobes have read only access to ctx parameters so I can modify the content of the buffer, since the pointer remains the same, but cannot alter the size
- NOTE TO SELF only changing _bpf functions or bpf_probe_read recompiles in 10 minutes or so, avoid touching files that are used everywhere and should be just fine


### 15/2/2020
- wrote an example to test probe read on another point. Used vfs_write and I am able to read the user buff 
- printk behavior is a bit iffy, also printf fmt string of the previous print, this totally looks like a security issue
- I can overwrite buffer from user to kernel
- might be convenient to recompile both read and write path with option to go through both normal and own path e.g. based on a given size value
- maybe upgrade to 5.5 since there seems to be probe read for user and kernel separately
```
<...>-6057  [000] ....  5883.578081: 0: __vfs_write 13 from 0000000000818dc8
<...>-6057  [000] ....  5883.578186: 0: intercepter ubuff hello world!
__vfs_write %d from %p
```

### 14/2/2020
- implemented map to pass buffer address to kernel space, turns out the weird different pointer is a printk issue
- investigating ways to debug bpf programs 
- https://fosdem.org/2020/schedule/event/debugging_bpf/attachments/slides/3934/export/events/attachments/debugging_bpf/slides/3934/FOSDEM20_QMO_eBPF_debugging_tools.pdf
- try to install bpftool, to inspect bytecode and to step single instruction with bpf test run

### 13/2/2020
- meeting

### 12/2/2020
- prepare presentation for meeting
- checked that bpf_helper probe read is indeed allowed for kprobe in the list of allowed helpers for kprobe
- https://elixir.bootlin.com/linux/v5.4/source/kernel/trace/bpf_trace.c#L687

### 9/2/2020
- The bpf_probe_read does not get kprobed even in tracex1 which is working and seems to actually trigger it
- https://developer.ibm.com/technologies/linux/articles/l-kernel-memory-access/
- not really my fuynction but it's a nice walkthroungh of copy to and from user to kernel space buffers 
 

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
