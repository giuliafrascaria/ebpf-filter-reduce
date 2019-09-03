## Q&A and random findings

- what does SEC() mean?
section, it is an indication to the loader to create a section in the ELF file with the name that is specified in brackets
https://www.redhat.com/en/blog/using-express-data-path-xdp-red-hat-enterprise-linux-8

- what can I pass to SEC() in the bpf context?
blf_load will take the elf file and match the section name to a specific program type. https://blogs.oracle.com/linux/notes-on-bpf-1. The strcmp for kernel 5.2 is:

```
bool is_socket = strncmp(event, "socket", 6) == 0;
bool is_kprobe = strncmp(event, "kprobe/", 7) == 0;
bool is_kretprobe = strncmp(event, "kretprobe/", 10) == 0;
bool is_tracepoint = strncmp(event, "tracepoint/", 11) == 0;
bool is_raw_tracepoint = strncmp(event, "raw_tracepoint/", 15) == 0;
bool is_xdp = strncmp(event, "xdp", 3) == 0;
bool is_perf_event = strncmp(event, "perf_event", 10) == 0;
bool is_cgroup_skb = strncmp(event, "cgroup/skb", 10) == 0;
bool is_cgroup_sk = strncmp(event, "cgroup/sock", 11) == 0;
bool is_sockops = strncmp(event, "sockops", 7) == 0;
bool is_sk_skb = strncmp(event, "sk_skb", 6) == 0;
bool is_sk_msg = strncmp(event, "sk_msg", 6) == 0;
```
- clang fails to compile if <stddef.h> is being included. this is because that file is not in the standard /usr/include/ location but in the gcc location (at least that's where I found it now). I had to explicitly include the gcc include folder to have it compile, for now. probably not the best solution

```
-I/usr/lib/gcc/x86_64-linux-gnu/7.4.0/include
```

- how to use PT_REGS_PARM? They should be the copy of the function arguments, so if the calling conventions are respected it's rdi rsi ...

```
#define PT_REGS_PARM1(x) ((x)->di)
#define PT_REGS_PARM2(x) ((x)->si)
#define PT_REGS_PARM3(x) ((x)->dx)
#define PT_REGS_PARM4(x) ((x)->cx)
#define PT_REGS_PARM5(x) ((x)->r8)
#define PT_REGS_RET(x) ((x)->sp)
#define PT_REGS_FP(x) ((x)->bp)
#define PT_REGS_RC(x) ((x)->ax)
#define PT_REGS_SP(x) ((x)->sp)
#define PT_REGS_IP(x) ((x)->ip)

```

-problem, I am probably including the wrong struct because when compiling I get
```
kprobe_open_kern.c:13:45: error: no member named 'di' in 'struct pt_regs'
  bpf_probe_read(&buf, sizeof(buf), (void *)PT_REGS_PARM1(ctx));
                                            ^~~~~~~~~~~~~~~~~~
../common/bpf_helpers.h:166:32: note: expanded from macro 'PT_REGS_PARM1'
#define PT_REGS_PARM1(x) ((x)->di)
                          ~~~  ^
1 error generated.

```
I need struct from bpf_context, that should have it
