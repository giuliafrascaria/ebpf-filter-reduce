#include <linux/skbuff.h>
#include <linux/netdevice.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include <linux/kernel.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>


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

struct bpf_map_def SEC("maps") result_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the average back to the user
};

struct bpf_map_def SEC("maps") jmp_table = 
{
	.type = BPF_MAP_TYPE_PROG_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u32),
	.max_entries = 8,
};


SEC("kprobe/copyout_bpf")
int bpf_copyout(struct pt_regs *ctx)
{

	// instantiate parameters
	void __user *to;
	const void *from;
	int blen;
    int ret;
    char curr[16];
    char buff[UBUFFSIZE];

	//parse parameters from ctx
	to = (void __user *) PT_REGS_PARM1(ctx);
	from = (const void *) PT_REGS_PARM2(ctx);
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

	int sum = 0;
	if (to == *val)
	{    

        for (int i = 0; i < 4096; i = i+1)
        {
			volatile int offset = i%2;
            sum = sum + 1;
            char mystring[] = "iD7WzYsZB1kGhhAC3p7VP6F6uVMRxkUd1wWnVQquiNQHCQAo8x0tKM7VydYFGbbJlmFwBZLTWEWzYWTxMPeyOqFeY2QLi7bCmPyHpF5bQ3hpqMqgPT0EbApZg9jPXVIaSSRvIbo6THUbvSHXNWoRD28N5jhVjoNjjGNY5jI6g1ssG9tzVgFc8Ek2NiF8IvxNloUDpegxHZFxmdq6adXjpczWkfb3zNytyQSc3MAdKm7bietPimPTPn0y4Ftitbq\n";
		    bpf_probe_write_user((void *) to + offset, mystring, 64);
        }
	}

	return 0;
}


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;