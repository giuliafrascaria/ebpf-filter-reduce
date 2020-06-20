#include <uapi/linux/bpf.h>
#include <linux/version.h>

#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>


//SEC("kprobe/sys_write")
//SEC("kprobe/copy_page_to_iter_giulia")
SEC("kprobe/copyout_bpf")
int bpf_prog1()
{
	char s[] = "giulia's function yeee\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}
char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;
