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
	.max_entries = 2,	//used to pass the average back to the user
};




SEC("kprobe/copyout_bpf")
int bpf_copyout(struct pt_regs *ctx)
{
	__u64 start = bpf_ktime_get_ns();

	void __user *to;
	const void *from;
	int blen;
    int ret;
    char curr[5];
    char buff[UBUFFSIZE];

	//parse parameters from ctx
	to = (void __user *) PT_REGS_PARM1(ctx);
	from = (const void *) PT_REGS_PARM2(ctx);
	blen = PT_REGS_PARM3(ctx);

	//check buffer address
	__u32 key = 0;
    __u32 key1 = 1;
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
        for (int i = 0; i < 16; i++)
        {
            ret = bpf_probe_read(buff, UBUFFSIZE, from+(UBUFFSIZE*i));    //copy and then iterate on user buffer, what the filterreduce would do
            if(ret >= 0)
				bpf_probe_write_user((void *) (to + UBUFFSIZE*i), buff, UBUFFSIZE);
        }
        

        unsigned long sum = 0;
        unsigned long num = 0; // need initialization or verifier complains on strtol
        u64 base = 10;
        unsigned long elems = 0;

        for (int i = 0; i <= 4096 - 4; i = i+4)
        {
            //ret = bpf_probe_read_str(curr, 3, userbuff+i);
            ret = bpf_probe_read_str(curr, 4, to+i);
            
            if (curr != NULL)
            {
                int res = bpf_strtoul(curr, sizeof(curr)-1, base, &num);
                if (res < 0)
                {
                    return 1;
                }
                elems = elems + 1;
            }
            //sum = sum + num;
        }


        __u64 end = bpf_ktime_get_ns();

        bpf_map_update_elem(&result_map, &key, &start, BPF_ANY);
        bpf_map_update_elem(&result_map, &key1, &end, BPF_ANY);
	}

	return 0;
}




char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;