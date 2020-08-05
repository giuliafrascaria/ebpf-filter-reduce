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

static int sequence = 0;
__s32 input_retval = 4;

__u64 fentry_result = 0;
SEC("fentry/copyout_fmod_test")
int fentry_test_copyout(void *ctx)
{
	char str2[] = "yo\n";
	bpf_trace_printk(str2, sizeof(str2));
	return 0;
}

/*
__u64 fmod_ret_result = 0;
SEC("fmod_ret/copyout_fmod_test")
int BPF_PROG(fmodret_test_copyout, int a, int ret)
{
	sequence++;
	//This is the first fmod_ret program, the ret passed should be 0 
	fmod_ret_result = (sequence == 2 && ret == 0);
	return input_retval;
}


__u64 fexit_result = 0;
SEC("fexit/copyout_fmod_test")
int BPF_PROG(fexit_test_copyout, int a, int ret)
{
	sequence++;
	//If the input_reval is non-zero a successful modification should have occurred.
	
	if (input_retval)
		fexit_result = (sequence == 3 && ret == input_retval);
	else
		fexit_result = (sequence == 3 && ret == 42); //the function executed, amirite? but I don't want to inject a different val

	return 0;
}*/


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;