#include <uapi/linux/bpf.h>
#include <linux/version.h>

#include "bpf_helpers.h"


//SEC("kprobe/sys_write")
SEC("kprobe/copy_page_to_iter_giulia")
int bpf_prog1()
{
	char s[] = "NOT A NOOB\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}



SEC("kprobe/copy_page_to_iter_iovec_giulia")
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

SEC("kprobe/_copy_to_iter_giulia")
int bpf_prog4()
{
	char s[] = "Where i'd actually want to be\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/copyout")
int bpf_prog5()
{
	char s[] = "copyout\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/raw_copy_to_user")
int bpf_prog6()
{
	char s[] = "copy to user\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;