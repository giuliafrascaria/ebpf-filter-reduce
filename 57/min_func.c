#include <linux/skbuff.h>
#include <linux/netdevice.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include <linux/kernel.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>

#define PROG(F) SEC("kprobe/"__stringify(F)) int bpf_func_##F

struct bpf_map_def SEC("maps") result_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the average back to the user
};

PROG(1)(struct pt_regs *ctx)
{

	void __user *to; //struct pt_regs *ctx
    int ret;
    char curr[3];

	//parse parameters from ctx
	to = (void __user *) PT_REGS_PARM1(ctx);

    ret = bpf_probe_read_str(curr, 3, to);

    char snonmidire[] = "tail call read stuff %s\n";
	bpf_trace_printk(snonmidire, sizeof(snonmidire), curr);

	__u32 key = 0;
    unsigned long sum = 42;
    bpf_map_update_elem(&result_map, &key, &sum, BPF_ANY);
	
	return 0;
}


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;