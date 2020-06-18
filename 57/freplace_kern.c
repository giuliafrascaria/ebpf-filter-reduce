// SPDX-License-Identifier: GPL-2.0

//#include <stdbool.h>
//#include <stddef.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
//#include <linux/ptrace.h>
//#include <linux/kernel.h>

#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>


#define bpf_debug(fmt, ...)                \
{                                          \
    char __fmt[] = fmt;                    \
    bpf_trace_printk(__fmt, sizeof(__fmt), \
                     ##__VA_ARGS__);       \
}

struct bpf_map_def SEC("maps") my_read_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the buffer address from userland
};


static int sequence = 0;
__s32 input_retval = 0;

__u64 fentry_result = 0;
SEC("fentry/copyout_bpf")
int BPF_PROG(fentry_copyout, void __user *to, const void *from, size_t n, int ret)
{

    if (n == 4095)
	{
        sequence++; //will only update if it is the correct buffer address
    }
    
    fentry_result = (sequence == 1);
	return 0;
}

__u64 fmod_ret_result = 0;
SEC("fmod_ret/copyout_bpf")
int BPF_PROG(fmod_ret_copyout, void __user *to, const void *from, size_t n, int ret)
{

    if (n == 4095)
	{
		
        char mystring[] = "42\n"; 
		bpf_probe_write_user((void *) to, mystring, sizeof(mystring));
    
        sequence++;
    }
    fmod_ret_result = (sequence == 2 && ret == 0);
	return 0;
}

__u64 fexit_result = 0;
SEC("fexit/copyout_bpf")
int BPF_PROG(fexit_copyout, void __user *to, const void *from, size_t n, int ret)
{
	sequence++;
	/* If the input_reval is non-zero a successful modification should have
	 * occurred.
	 */
	if (input_retval)
		fexit_result = (sequence == 3 && ret == input_retval);
	else
		fexit_result = (sequence == 3 && ret == 0);

	return 0;
}


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;