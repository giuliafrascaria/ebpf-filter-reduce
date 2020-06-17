// SPDX-License-Identifier: GPL-2.0
#include <stdbool.h>
#include <stddef.h>

#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include <linux/kernel.h>

#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>



SEC("fentry/copyout")
int BPF_PROG(prog1)
{
    char n[] = "fentry copyout bpf\n";
	bpf_trace_printk(n, sizeof(n)); 

	return 0;
}



char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;