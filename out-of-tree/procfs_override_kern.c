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


SEC("kprobe/myread")
int bpf_read(struct pt_regs *ctx)
{
	// instantiate parameters
	void __user *to;
	int len;

	//parse parameters from ctx
	to = (char __user *) PT_REGS_PARM2(ctx);
	len = PT_REGS_PARM3(ctx);

	char s[] = "myread\n";
	bpf_trace_printk(s, sizeof(s)); 

	unsigned long rc = len;
	bpf_override_return(ctx, rc);
		
    char mystring[] = "42\n"; 
	bpf_probe_write_user((void *) to, mystring, sizeof(mystring));

	return 0;
}


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;