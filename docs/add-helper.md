### Implement your own bpf helper

Sometimes, you might be in need of implementing your own functionality for bpf.
If the many available helpers are not enough (or do not work) you might need to implement one on your own

https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md

let's add a bpf helper that simply prints a message to dmesg

you will need
- the types of bpf program that are going to have this helper whitelisted
- the prototype of the function
- the code of the helper
- add the prototype to the enumeration in the user utils
- ?? hopefully that's it

### helper for kprobes

the helper function is bpf_printk. the code for the function is the following, and can be added in /kernel/trace/bpf_trace.c


```
BPF_CALL_0(bpf_printk)
{
	printk(KERN_DEBUG "mostly harmless\n");
	return (int) 1;
}

static const struct bpf_func_proto bpf_printk_proto = 
{
	.func		= bpf_printk,
	.gpl_only	= true,
	.ret_type	= RET_INTEGER,
};
```
The prototype needs to be added to the switch/case of the relevant bpf type. In this case, it is kprobe_prog_func_proto.
The switch case can be extended with the following branch

```
case BPF_FUNC_printk:
		return &bpf_printk_proto;
```

ok, now that we have the code in place we also need to export this as a helper to allow compilation.
The prototype of the function needs to be added to /tools/testing/selftests/bpf/bpf_helpers.h

```
static int (*bpf_printk)(void) = (void *) BPF_FUNC_printk;
```
the function name needs to be added to the enumeration in the API as well, otherwise compilation will fail.
the symbol needs to be added in /include/uapi/linux/bpf.h in the #define __BPF_FUNC_MAPPER(FN)

```
FN(printk),
```

at this point I THINK this should be it, let's try to recompile and export the new headers in the global and local folder