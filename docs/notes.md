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

- in the linux kernel, bpf.h I found this: but where is it defined then?

```
/* bpf_context is intentionally undefined structure. Pointer to bpf_context is
 * the first argument to eBPF programs.
 * For socket filters: 'struct bpf_context *' == 'struct sk_buff *'
 */
struct bpf_context;

```
answer: in the man page
```
By picking prog_type program author  selects  a  set  of  helper
              functions callable from eBPF program and corresponding format of
              struct bpf_context (which is  the  data  blob  passed  into  the
              program  as  the  first  argument).   For  example, the programs
              loaded with  prog_type  =  TYPE_TRACING  may  call  bpf_printk()
              helper,  whereas  TYPE_SOCKET  programs  may  not.   The  set of
              functions  available  to  the  programs  under  given  type  may
              increase in the future.

              Currently the set of functions for TYPE_TRACING is:
              bpf_map_lookup_elem(map_fd, void *key)              // lookup key in a map_fd
              bpf_map_update_elem(map_fd, void *key, void *value) // update key/value
              bpf_map_delete_elem(map_fd, void *key)              // delete key in a map_fd
              bpf_ktime_get_ns(void)                              // returns current ktime
              bpf_printk(char *fmt, int fmt_size, ...)            // prints into trace buffer
              bpf_memcmp(void *ptr1, void *ptr2, int size)        // non-faulting memcmp
              bpf_fetch_ptr(void *ptr)    // non-faulting load pointer from any address
              bpf_fetch_u8(void *ptr)     // non-faulting 1 byte load
              bpf_fetch_u16(void *ptr)    // other non-faulting loads
              bpf_fetch_u32(void *ptr)
              bpf_fetch_u64(void *ptr)

              and bpf_context is defined as:
              struct bpf_context {
                  /* argN fields match one to one to arguments passed to trace events */
                  u64 arg1, arg2, arg3, arg4, arg5, arg6;
                  /* return value from kretprobe event or from syscall_exit event */
                  u64 ret;
              };
```
so I should be finding something that depends on bpf prog type for my case, kprobe?




error: 'asm goto' constructs are not supported yet
        return GEN_UNARY_RMWcc(LOCK_PREFIX "incl", v->counter, e);

found linux patch in the mailing list, try
https://lkml.org/lkml/2018/4/10/825
