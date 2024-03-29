#include <uapi/linux/bpf.h>
#include "bpf_helpers.h"
#include <linux/version.h>

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

------------------------------------------

sudo cat /sys/kernel/debug/tracing/events/syscalls/sys_exit_read/format
name: sys_exit_read
ID: 649
format:
	field:unsigned short common_type;	offset:0;	size:2;	signed:0;
	field:unsigned char common_flags;	offset:2;	size:1;	signed:0;
	field:unsigned char common_preempt_count;	offset:3;	size:1;	signed:0;
	field:int common_pid;	offset:4;	size:4;	signed:1;

	field:int __syscall_nr;	offset:8;	size:4;	signed:1;
	field:long ret;	offset:16;	size:8;	signed:1;

print fmt: "0x%lx", REC->ret

*/

struct sys_enter_read_args 
{
	unsigned long long unused;
	long syscall_nr;
	long fd;
	long buf; //save it to inspect at the end of the open
	long mode;
};

//I do not have the buffer address outside of the open call, but can I save it in the map?
struct sys_exit_read_args 
{
	unsigned long long unused;
	long syscall_nr;
	long ret;
};


struct bpf_map_def SEC("maps") my_map =
{
        .type = BPF_MAP_TYPE_ARRAY,
        .key_size = sizeof(u32),
        .value_size = sizeof(u32),
        .max_entries = 1	// holding userland info, like pid and file descriptor
};

struct bpf_map_def SEC("maps") my_read_map =
{
        .type = BPF_MAP_TYPE_ARRAY,
        .key_size = sizeof(u32),
        .value_size = sizeof(u64),
        .max_entries = 1,	//used upon entry to read call, used to pass the buffer address to the return point
};

struct bpf_map_def SEC("maps") my_buffer_map =
{
        .type = BPF_MAP_TYPE_ARRAY,
        .key_size = sizeof(u32),
        .value_size = sizeof(u64),
        .max_entries = 1,	//used upon entry to read call, used to pass the buffer address to the return point
};

struct bpf_map_def SEC("maps") my_char_map =
{
        .type = BPF_MAP_TYPE_ARRAY,
        .key_size = sizeof(u32),
        .value_size = sizeof(char),
        .max_entries = 1,	//return 1 char to userland through the map, as read from the buffer upon return from the read syscall
};


// bpf instrumentation for the read syscall (entry point)

SEC("tracepoint/syscalls/sys_enter_read")
int attach_read(struct sys_enter_read_args *ctx) 
{

	//get pid frdom map and compare to current pid
	__u32 pid_key = 0;
	__u32* pid;
	pid = bpf_map_lookup_elem(&my_map, &pid_key);
	if(!pid)
	{
		char s[] = "error reading pid value from map\n";
		bpf_trace_printk(s, sizeof(s));
		return 0;
	}

	char str[] = "pid on map %ld\n";
	bpf_trace_printk(str, sizeof(str), *pid);


	__u32 tgid = bpf_get_current_pid_tgid() >> 32;
	char str1[] = "tgid %ld\n";
	bpf_trace_printk(str1, sizeof(str1), tgid);

	if ( tgid == *pid)
	{
		__u32 key = 0;
		__u64 ** val;
		val = bpf_map_lookup_elem(&my_read_map, &key);

		if(!val)
		{
			char s[] = "error reading buffer value from map, read entry\n";
			bpf_trace_printk(s, sizeof(s)); 
			return 0;
		}

		char str2[] = "buffer on params %lu, buffer on map %lu\n";
		bpf_trace_printk(str2, sizeof(str2), (unsigned long) ctx->buf, (unsigned long) *val);

		if ((char *) *val == (char *) ctx->buf)
		{
			char s[] = "matching targeted buffer with param buffer on read entry\n";
			bpf_trace_printk(s, sizeof(s));

			//success, I successfully read the filename from the map
			//update read_map, will be used by the read bpf instumentation	

			//char * buf = (char *) ctx->buf;
			//bpf_map_update_elem(&my_read_map, &key, &buf, BPF_ANY);  

			//return 0;
		}
		else
		{
			char s[] = "buffer value mismatch on read entry\n";
			bpf_trace_printk(s, sizeof(s));
			//return 0;

		}

	}
	else
	{
		char s[] = "pid mismatch\n";
		bpf_trace_printk(s, sizeof(s));
	}
	
	
	return 0;
}


SEC("tracepoint/syscalls/sys_exit_read")
int attach_exit_read(struct sys_exit_read_args *ctx) {
	
	//get pid frdom map and compare to current pid
	__u32 pid_key = 0;
	__u32* pid;
	pid = bpf_map_lookup_elem(&my_map, &pid_key);
	if(!pid)
	{
		char s[] = "error reading pid value from map\n";
		bpf_trace_printk(s, sizeof(s));
		return 0;
	}

	char str[] = "pid on map %ld\n";
	bpf_trace_printk(str, sizeof(str), *pid);


	__u32 tgid = bpf_get_current_pid_tgid() >> 32;
	char str1[] = "tgid %ld\n";
	bpf_trace_printk(str1, sizeof(str1), tgid);

	if ( tgid == *pid)
	{
		//delete the pid to allow future usage 
		bpf_map_delete_elem(&my_map, &pid_key);


		//targeting the right buffer, can look up on read map		
		long key = 0;
		__u64 ** buf;
		buf = bpf_map_lookup_elem(&my_read_map, &key); //at this point I should be having the full read buffer, I'll try to read it on exit and save a char on map
		
		if(!buf)
		{
			char s[] = "error reading buffer value from map\n";
			bpf_trace_printk(s, sizeof(s)); 
			return 0;
		}
		else 
		{		
			char s[] = "read buffer from map on read exit %lu\n";
			bpf_trace_printk(s, sizeof(s), * buf);
			//success, I successfully read the buf from the map
			//update read_map to save a char of the buffer on map	
			
			//bpf_map_delete_elem(&my_read_map, &key);


			long charkey = 0;
			//u32 bufkey = 0;
			char single_char;

			//single_char = **buf;

			//	if (bpf_probe_read(&orig_addr, sizeof(orig_addr), sockaddr_arg) != 0)
			//return 0;

			if (bpf_probe_read(&single_char, sizeof(single_char), (void *) *buf) != 0) 
			{
				char serr[] = "error reading char from user buff\n";
				bpf_trace_printk(serr, sizeof(serr));
				return 0;
			}
			char s1[] = "read char from user buffer %c\n";
			bpf_trace_printk(s1, sizeof(s1), single_char);
			//char * userbuf = buf;

			//bpf_map_update_elem(&my_buffer_map, &bufkey, &userbuf, BPF_ANY);  

			bpf_map_update_elem(&my_char_map, &charkey, &single_char, BPF_ANY);  
		}	
	}
	else
	{
		char s[] = "pid mismatch on read exit\n";
		bpf_trace_printk(s, sizeof(s));
	}


	return 0;
}

char _license[] SEC("license") = "GPL";
u32 _version SEC("version") = LINUX_VERSION_CODE;
