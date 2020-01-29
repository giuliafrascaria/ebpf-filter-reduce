#include <uapi/linux/bpf.h>
#include "bpf_helpers.h"
#include <linux/version.h>
//#include <string.h>
//#include <stdlib.h>

// I need a map structure to return the result to userland

struct bpf_map_def SEC("maps") read_file_map = {
        .type = BPF_MAP_TYPE_ARRAY,
        .key_size = sizeof(u32),
        .value_size = sizeof(u32),
        .max_entries = 1,
};

// min function
void min(void * map)
{
	// buffer format:
	// int int int int int ...
	// parse the content and keep track of min

	long int min = 0;
	char s[100] = {};

	for(int i = 0; i < 10; i++)
	{
		//bpf_probe_read(s, )
		if (min >= num)
		{
			min = num;
		}
	}
	value = bpf_map_lookup_elem(map, &key);
	if (value)
		*value = min;
	else
		bpf_map_update_elem(map, &key, &min, BPF_NOEXIST);

}

// bpf instrumentation for the read syscall (entry point)
//SEC("kprobe/sys_read")
//int bpf_prog1()
//{
//        char s[] = "test entry\n";
//        bpf_trace_printk(s, sizeof(s));
//        return 0;
//}



// probably I better be using kretprobe (return point), so that the read bytes are found in the buffer


//tracepoint for syscall
SEC("tracepoint/syscalls/sys_read")
int bpf_prog2(struct syscalls_exit_read_args *ctx)
{
        char s[100] = {};
        bpf_trace_printk(s, sizeof(s));
        min((void *) &read_file_map);
	return 0;
}


char _license[] SEC("license") = "GPL";
u32 _version SEC("version") = LINUX_VERSION_CODE;
