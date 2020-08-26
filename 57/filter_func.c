#include <linux/skbuff.h>
#include <linux/netdevice.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include <linux/kernel.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>

#define PROG(F) SEC("kprobe/"__stringify(F)) int bpf_func_##F
#define	UBUFFSIZE	256

struct bpf_map_def SEC("maps") result_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the average back to the user
};

struct bpf_map_def SEC("maps") jmp_table = {
	.type = BPF_MAP_TYPE_PROG_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u32),
	.max_entries = 8,
};

PROG(1)(struct pt_regs *ctx)
{
    void __user *to; //struct pt_regs *ctx
    const void *from;
    int ret;
    char curr[3];
	__u32 key = 0;
	__u64 ** val;
    int blen;
	//parse parameters from ctx
	to = (void __user *) PT_REGS_PARM1(ctx);
    from = (const void *) PT_REGS_PARM2(ctx);
	blen = PT_REGS_PARM3(ctx);


    char snonmidire[] = "tail call read stuff filter\n";
	bpf_trace_printk(snonmidire, sizeof(snonmidire));

    
    unsigned long sum = 0;
    unsigned long num = 0; // need initialization or verifier complains on strtol
    u64 base = 10;
    unsigned long elems = 0;

    for (int i = 0; i < UBUFFSIZE - 3; i = i+3)
    {
        //ret = bpf_probe_read_str(curr, 3, userbuff+i);
        ret = bpf_probe_read_str(curr, 3, from+i);
        
        if (curr != NULL)
        {
            int res = bpf_strtoul(curr, sizeof(curr), base, &num);
            if (res < 0)
            {
                return 1;
            }
            elems = elems + 1;
        }

        //char s3[] = "copyout char %s converted to %d\n";
        //bpf_trace_printk(s3, sizeof(s3), curr, num);

        sum = sum + num;
    }

    //unsigned long avg = sum/elems;
    
    //char s4[] = "sum of numbers is %lu, avg is %lu, read %lu elements\n";
    //bpf_trace_printk(s4, sizeof(s4), sum, avg, elems);
    char s4[] = "sum of numbers is %lu read %lu elements\n";
    bpf_trace_printk(s4, sizeof(s4), sum, elems);

    bpf_map_update_elem(&result_map, &key, &sum, BPF_ANY);

    //doesn't work because then copyout bpf is called and overwrites this, until I have an integrated edit of the return value
    char mystring[] = "42\n";
    bpf_probe_write_user((void *) to, mystring, sizeof(mystring));


    bpf_tail_call(ctx, &jmp_table, (int) 1);
	
	return 0;
}


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;