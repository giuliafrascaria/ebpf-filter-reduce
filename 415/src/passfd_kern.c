#include <uapi/linux/bpf.h>
#include "bpf_helpers.h"
#include <linux/version.h>

// I need a map structure to return the result to userland

/*
sudo cat /sys/kernel/debug/tracing/events/syscalls/sys_enter_read/format
name: sys_enter_read
ID: 660
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
	field:int common_pid;	offset:4;	size:4;	signed:1;

	field:int __syscall_nr;	offset:8;	size:4;	signed:1;
	field:unsigned int fd;	offset:16;	size:8;	signed:0;
	field:char * buf;	offset:24;	size:8;	signed:0;
	field:size_t count;	offset:32;	size:8;	signed:0;

print fmt: "fd: 0x%08lx, buf: 0x%08lx, count: 0x%08lx", ((unsigned long)(REC->fd)), ((unsigned long)(REC->buf)), ((unsigned long)(REC->count))
*/

struct sys_enter_read_args 
{
	unsigned long long unused;
	long syscall_nr;
	long fd;
	long buf;
	long mode;
};


struct bpf_map_def SEC("maps") my_map =
{
        .type = BPF_MAP_TYPE_ARRAY,
        .key_size = sizeof(u32),
        .value_size = sizeof(u32),
        .max_entries = 1,
};

struct bpf_map_def SEC("maps") my_read_map =
{
        .type = BPF_MAP_TYPE_ARRAY,
        .key_size = sizeof(u32),
        .value_size = sizeof(u32),
        .max_entries = 1,
};


// bpf instrumentation for the read syscall (entry point)

SEC("tracepoint/syscalls/sys_enter_read")
int attach_read(struct sys_enter_read_args *ctx) {
	
	long key = 0;
 	long * val;
       	val = bpf_map_lookup_elem(&my_map, &key);
	
	if(!val)
	{
		char s[] = "error reading value from map\n";
        	bpf_trace_printk(s, sizeof(s)); 
		return 0;
	}
	char s[] = "read value from map\n";
        bpf_trace_printk(s, sizeof(s));

 	
	//if (*val == ctx->fd)
	//{
 		//success, I successfully read the filename from the map
		//update fd_map, will be used by the read bpf instumentation	
	__u32 fd = 1;
	bpf_map_update_elem(&my_read_map, &key, &fd, BPF_ANY);  
 	//}
	return 0;
}
/*
SEC("tracepoint/syscalls/sys_enter_read")
int attach_read(struct sys_enter_read_args *ctx) {
	char s[] = "tracepoint hooked\n";
	bpf_trace_printk(s, sizeof(s)); 
	return 0;
}*/


char _license[] SEC("license") = "GPL";
u32 _version SEC("version") = LINUX_VERSION_CODE;
