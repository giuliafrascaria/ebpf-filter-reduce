#include <linux/skbuff.h>
#include <linux/netdevice.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include <linux/kernel.h>
#include "bpf_helpers.h"

SEC("kprobe/copyout_bpf")
int bpf_prog7(struct pt_regs *ctx)
{

	//char s1[] = "entering modified copyout\n";
	//bpf_trace_printk(s1, sizeof(s1));
	
	char teststring[3] = "42\n"; 
	long num = 0;
	u64 base = 10;

	if (teststring != NULL)
	{
		//int res = bpf_kstrtol(teststring, base, &num);
		int res = bpf_strtol(teststring, sizeof(teststring), base, &num);
		if (res < 0)
		{
			return 1;
		}	
	}
	/*
	const char * teststring;
	teststring = "42";
	long testnum = 42;
	u64 base = 10;
	int res = bpf_strtol(teststring, sizeof(teststring), base, &testnum);
	if (res < 0)
	{
		return 1;
	}*/

	char n[] = "converted num to int %d from %s\n";
	bpf_trace_printk(n, sizeof(n), num, teststring); 

	return 0;
}

char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;