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



SEC("fentry/copyout_bpf")
int BPF_PROG(prog1)
{
    char n[] = "fentry copyout bpf\n";
	bpf_trace_printk(n, sizeof(n)); 

	return 0;
}


char _license[] SEC("license") = "GPL";