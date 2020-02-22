#include <linux/skbuff.h>
#include <linux/netdevice.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include "bpf_helpers.h"


#define _(P) ({typeof(P) val = 0; bpf_probe_read(&val, sizeof(val), &P); val;})
#define	UBUFFSIZE 13

struct bpf_map_def SEC("maps") my_read_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the buffer address from userland
};


SEC("kprobe/vfs_write")
int bpf_prog11(struct pt_regs *ctx)
{

	const char __user *from;
	size_t len;

	from = (const char __user *) PT_REGS_PARM2(ctx);
	len  = PT_REGS_PARM3(ctx);

	if (len == 4)
	{

		char s[] = "__vfs_write %d from %p\n";
		bpf_trace_printk(s, sizeof(s), len, from);

        char userbuff[UBUFFSIZE]; 
        bpf_probe_read(userbuff, sizeof(userbuff), from);

        if (userbuff[0] == 'a')
        {
            char s1[] = "intercepted ubuff %s\n";
            bpf_trace_printk(s1, sizeof(s1), userbuff);

			char mystring[] = "xyy";
			bpf_probe_write_user((void *) from, mystring, sizeof(mystring));

			size_t newsize = sizeof(mystring);
			bpf_probe_write_user((size_t *) &len, &newsize, sizeof(newsize));

        }
	}

	return 0;
}


char _license[] SEC("license") = "GPL";
u32 _version SEC("version") = LINUX_VERSION_CODE;