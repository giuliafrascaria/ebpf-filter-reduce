// SPDX-License-Identifier: GPL-2.0
//#include <stdbool.h>
//#include <stddef.h>

#include <uapi/linux/bpf.h>
#include <linux/version.h>
//#include <linux/ptrace.h>
//#include <linux/kernel.h>

//#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>


#define bpf_debug(fmt, ...)                \
{                                          \
    char __fmt[] = fmt;                    \
    bpf_trace_printk(__fmt, sizeof(__fmt), \
                     ##__VA_ARGS__);       \
}


SEC("kprobe/copyout_bpf")
int bpf_prog1()
{
    
	//bpf_debug("hemlo\n");
	char s[] = "hemlo\n";
	bpf_trace_printk(s, sizeof(s));

	//printk("idk\n");

	return 0;
}



char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;