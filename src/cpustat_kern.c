#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include "bpf_helpers.h"



SEC("kprobe/sys_write")
int bpf_prog1()
{

	char msg[] = "hello world\n";

	bpf_trace_printk(msg, sizeof(msg));

	return 0;
}

char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;
/*

struct bpf_map_def SEC("maps") my_map = {
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(__u32),
	.value_size = sizeof(long),
	.max_entries = 256,
};
*/
