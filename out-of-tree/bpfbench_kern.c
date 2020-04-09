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
#define	UBUFFSIZE	4096

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

struct bpf_map_def SEC("maps") debug_map = {
	.type = BPF_MAP_TYPE_PERF_EVENT_ARRAY,
	.key_size = sizeof(int),
	.value_size = sizeof(int),
	.max_entries = 64,
};

struct bpf_map_def SEC("maps") jmp_table = {
	.type = BPF_MAP_TYPE_PROG_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u32),
	.max_entries = 8,
};

#define AVG_FUNC 1
#define MAX_FUNC 2
#define MIN_FUNC 3



SEC("kprobe/copyout_bpf")
int bpf_copyout(struct pt_regs *ctx)
{

	// instantiate parameters
	void __user *to;
	const void *from;
	int blen;

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


	if (to == *val)
	{

		unsigned long rc = 0;
		bpf_override_return(ctx, rc);

		char userbuff[UBUFFSIZE];
		int ret;
		ret = bpf_probe_read_str(userbuff, sizeof(userbuff), from);
		
		unsigned long sum = 0;
		char curr[3];
		unsigned long num = 0; // need initialization or verifier complains on strtol
		u64 base = 10;
		unsigned long elems = 0;

		/*
		for (int i = 0; i < UBUFFSIZE - 3; i = i+3)
		{
			//ret = bpf_probe_read_str(curr, 3, userbuff+i);
			ret = bpf_probe_read_str(curr, 3, from+i);
			
			if (curr != NULL)
			{
				int res = bpf_strtoul(curr, sizeof(curr), base, &num);
                //int res = bpf_strtoul((char *) from+i, (size_t) 3, base, &num);
				if (res < 0)
				{
					return 1;
				}
				elems = elems + 1;
			}

			sum = sum + num;
		}*/

		for (int i = 0; i < 16; i++)
		{
			//ret = bpf_probe_read_str(curr, 3, userbuff+i);
			ret = bpf_probe_read_str(userbuff, sizeof(userbuff), from+(i*256));

			for (int j = 0; j < 85; j++)
			{

				if (userbuff != NULL)
				{
					int res = bpf_strtoul(userbuff +j*3, 3, base, &num);
					//int res = bpf_strtoul((char *) from+i, (size_t) 3, base, &num);
					if (res < 0)
					{
						return 1;
					}
					elems = elems + 1;
				}

				sum = sum + num;
			}
			
		}

		unsigned long avg = sum/elems;

		bpf_map_update_elem(&result_map, &key, &avg, BPF_ANY);

		//doesn't work because then copyout bpf is called and overwrites this, until I have an integrated edit of the return value
		//char mystring[] = "42\n";
		//bpf_probe_write_user((void *) to, mystring, sizeof(mystring));


	}

	return 0;
}


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;