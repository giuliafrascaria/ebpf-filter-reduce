#include <linux/skbuff.h>
#include <linux/netdevice.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include <linux/kernel.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>

/*
the filter function takes the from buffer as input, and filters the result to the user buffer
the reduce fuction is called afterwards
*/

#define PROG(F) SEC("kprobe/"__stringify(F)) int bpf_func_##F
#define	UBUFFSIZE	256


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
    const void *from;
    int ret;
    char curr[7];
    char buff[UBUFFSIZE];
	__u32 key = 0;
	__u64 ** val;
    int blen;

	//parse parameters from ctx
	to = (void __user *) PT_REGS_PARM1(ctx);
    from = (const void *) PT_REGS_PARM2(ctx);
	blen = PT_REGS_PARM3(ctx);


    //char snonmidire[] = "tail call read stuff filter\n";
	//bpf_trace_printk(snonmidire, sizeof(snonmidire));

    
    unsigned long sum = 0;
    unsigned long num = 0; // need initialization or verifier complains on strtol
    u64 base = 10;
    unsigned long elems = 0;



    for (int i = 0; i < 16; i++)
    {
        for (int j = 0; j < UBUFFSIZE-10; j = j+1)
        {
            //ret = bpf_probe_read_str(curr, 3, userbuff+i);
            ret = bpf_probe_read_str(curr, 6, from+j+i*16);
            
            /*if (curr != NULL)
            {
                int res = bpf_strtoul(curr, sizeof(curr), base, &num);
                if (res < 0)
                {
                    return 1;
                }
                
            }*/
            elems = elems + 1;

        }
    }

    bpf_map_update_elem(&result_map, &key, &elems, BPF_ANY);
	
	return 0;
}


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;