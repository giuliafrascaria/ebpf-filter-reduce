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
