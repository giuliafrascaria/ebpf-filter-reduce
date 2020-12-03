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

struct bpf_map_def SEC("maps") test_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the buffer address from userland
};



SEC("kprobe/copyout_bpf")
int bpf_copyout(struct pt_regs *ctx)
{
	

	void __user *to;
	const void *from;
	int blen;
    int ret;
    char curr[257];
    char buff[UBUFFSIZE];

	//parse parameters from ctx
	to = (void __user *) PT_REGS_PARM1(ctx);
	from = (const void *) PT_REGS_PARM2(ctx);
	blen = PT_REGS_PARM3(ctx);

	//check buffer address
	__u32 key = 0;
    __u32 key1 = 1;
	__u64 ** val;
    __u64 *testcase;
	val = bpf_map_lookup_elem(&my_read_map, &key);
    testcase = bpf_map_lookup_elem(&test_map, &key);

	if(!val)
	{
		char s[] = "error reading buffer value from map, read entry\n";
		bpf_trace_printk(s, sizeof(s)); 
		return 0;
	}
    if(!testcase)
    {
        char s[] = "error reading buffer value from map, read entry\n";
		bpf_trace_printk(s, sizeof(s)); 
		return 0;
    }

	

	if (to == *val)
	{
        __u64 start;
        __u64 end;
        //ret = bpf_probe_read_str(curr, 3, userbuff+i);
        if (*testcase == 1)
        {
            
            ret = bpf_probe_read_str(curr, 4, from);
            

            
            if (curr != NULL)
            {
                curr[0] = 'a';
                start = bpf_ktime_get_ns();
                ret = bpf_probe_write_user((void *) to, curr, 4);
                end = bpf_ktime_get_ns();

                if (ret >= 0)
                {
                    bpf_map_update_elem(&result_map, &key, &start, BPF_ANY);
                    bpf_map_update_elem(&result_map, &key1, &end, BPF_ANY);
                }
            }
        }
        if (*testcase == 2)
        {
            ret = bpf_probe_read_str(curr, 16, from);
            
            
            if (curr != NULL)
            {
                curr[0] = 'a';
                start = bpf_ktime_get_ns();
                ret = bpf_probe_write_user((void *) to, curr, 16);
                end = bpf_ktime_get_ns();

                if (ret >= 0)
                {
                    bpf_map_update_elem(&result_map, &key, &start, BPF_ANY);
                    bpf_map_update_elem(&result_map, &key1, &end, BPF_ANY);
                }
            }
        }
        if (*testcase == 3)
        {
            ret = bpf_probe_read_str(curr, 64, from);
            
            
            if (curr != NULL)
            {
                curr[0] = 'a';
                start = bpf_ktime_get_ns();
                ret = bpf_probe_write_user((void *) to, curr, 64);
                end = bpf_ktime_get_ns();

                if (ret >= 0)
                {
                    bpf_map_update_elem(&result_map, &key, &start, BPF_ANY);
                    bpf_map_update_elem(&result_map, &key1, &end, BPF_ANY);
                }
            }
        }
        if (*testcase == 4)
        {
            ret = bpf_probe_read_str(curr, 128, from);
            

            
            if (curr != NULL)
            {
                curr[0] = 'a';
                start = bpf_ktime_get_ns();
                ret = bpf_probe_write_user((void *) to, curr, 128);
                end = bpf_ktime_get_ns();

                if (ret >= 0)
                {
                    bpf_map_update_elem(&result_map, &key, &start, BPF_ANY);
                    bpf_map_update_elem(&result_map, &key1, &end, BPF_ANY);
                }
            }
        }
        if (*testcase == 5)
        {
            ret = bpf_probe_read_str(curr, 256, from);
            
            if (curr != NULL)
            {
                curr[0] = 'a';
                start = bpf_ktime_get_ns();
                ret = bpf_probe_write_user((void *) to, curr, 256);
                end = bpf_ktime_get_ns();

                if (ret >= 0)
                {
                    bpf_map_update_elem(&result_map, &key, &start, BPF_ANY);
                    bpf_map_update_elem(&result_map, &key1, &end, BPF_ANY);
                }
            }
        }
        
        //sum = sum + num;

	}

    unsigned long rc = 0;
	bpf_override_return(ctx, rc);
	return 0;
}




char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;