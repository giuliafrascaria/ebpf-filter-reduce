#include <linux/skbuff.h>
#include <linux/netdevice.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include <linux/kernel.h>
#include "bpf_helpers.h"


#define _(P) ({typeof(P) val = 0; bpf_probe_read(&val, sizeof(val), &P); val;})
#define PROG(F) SEC("kprobe/"__stringify(F)) int bpf_func_##F
//#define	UBUFFSIZE	2048
#define	UBUFFSIZE	256

struct bpf_map_def SEC("maps") my_read_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the buffer address from userland
};

SEC("kprobe/copyout_bpf")
int bpf_copyout(struct pt_regs *ctx)
{

	// instantiate parameters
	void __user *to;
	int blen;

	//parse parameters from ctx
	to = (void __user *) PT_REGS_PARM1(ctx);
	blen = PT_REGS_PARM3(ctx);

	//check buffer address
	__u32 key = 0;
	__u64 ** val;
	val = bpf_map_lookup_elem(&my_read_map, &key);

	if(!val)
	{
		char s[] = "error reading buffer value from map, read entry\n";
		bpf_trace_printk(s, sizeof(s)); 
		return 0;
	}

	if (to == *val)
	{
		unsigned long rc = 0;
		bpf_override_return(ctx, rc);
		
        char mystring[] = "42\n";
		bpf_probe_write_user((void *) to, mystring, sizeof(mystring));

		char s2[] = "copyout buf %lu size %d\n";
		bpf_trace_printk(s2, sizeof(s2), (unsigned long) to, blen);
	}

	return 0;
}


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;