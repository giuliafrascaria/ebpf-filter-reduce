#include <uapi/linux/bpf.h>
#include <linux/version.h>


#include "bpf_helpers.h"


//SEC("kprobe/sys_write")
SEC("kprobe/copy_page_to_iter")
int bpf_prog1()
{
	char s[] = "copyout\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

/*
SEC("kprobe/copy_page_to_iter_bpf")
int bpf_prog1()
{
	char s[] = "copy_page_to_iter\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}



SEC("kprobe/copy_page_to_iter_iovec_bpf")
int bpf_prog2()
{
	char s[] = "copy_page_to_iter_iovec\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/copy_page_to_iter_pipe")
int bpf_prog3()
{
	char s[] = "copy_page_to_iter_pipe\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/_copy_to_iter_bpf")
int bpf_prog4()
{
	char s[] = "Where i'd actually want to be\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/copyout_bpf")
int bpf_prog5(struct pt_regs *ctx)
{

	char s1[] = "entering copyout\n";
	bpf_trace_printk(s1, sizeof(s1));

	void __user *to;
	const void *from;
	to = PT_REGS_PARM1(ctx);
	from = PT_REGS_PARM2(ctx);

	char s2[] = "copyout to 0x%p from 0x%p\n";
	bpf_trace_printk(s2, sizeof(s2), to, from);

	char singlechars[2];
	int ret;
	ret = bpf_probe_read(&singlechars, 1, (void *) PT_REGS_PARM2(ctx));

	if (ret != 0) 
	{
		char serr[] = "error reading char from kernel buff\n";
		bpf_trace_printk(serr, sizeof(serr));
		return 0;
	}

	char s[] = "copyout to 0x%p from 0x%p char %c\n";
	bpf_trace_printk(s, sizeof(s), to, from, singlechars[0]);
	return 0;
}

SEC("kprobe/bpf_probe_read")
int bpf_prog6()
{
	char s[] = "bpf_probe_read\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}*/

char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;