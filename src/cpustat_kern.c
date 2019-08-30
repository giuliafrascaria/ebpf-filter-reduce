#include <uapi/linux/bpf.h>
#include <uapi/linux/if_ether.h>
#include <uapi/linux/if_packet.h>
#include <uapi/linux/ip.h>
#include "bpf_helpers.h"

struct bpf_map_def SEC("maps") my_map = {
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(__u32),
	.value_size = sizeof(long),
	.max_entries = 256,
};

SEC("socket1")
int bpf_prog1(struct __sk_buff *skb)
{

	char msg[] = "hello world\n";
	char store[] = "fieldfield";

	bpf_trace_printk(msg, sizeof(msg), store);


	return 0;
}
char _license[] SEC("license") = "GPL";
