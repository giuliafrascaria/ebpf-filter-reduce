#include <uapi/linux/bpf.h>
#include <linux/version.h>

#include "bpf_helpers.h"

SEC("kprobe/sys_write")
int bpf_prog1()
{
	char s[] = "test\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}
char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;
