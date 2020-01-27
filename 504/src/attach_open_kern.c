// part of the code is taken from the sample in linux kernel syscall_tp_kern.

#include <uapi/linux/bpf.h>
#include "bpf_helpers.h"

//https://github.com/torvalds/linux/blob/master/fs/open.c line 1082
struct syscalls_enter_open_args 
{
	unsigned long long unused;
	long syscall_nr;
	long filename_ptr;
	long flags;
	long mode;
};


struct syscalls_exit_open_args {
	unsigned long long unused;
	long syscall_nr;
	long ret;
};


struct bpf_map_def SEC("maps") enter_open_map = 
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(long),
	.max_entries = 1,
};


struct bpf_map_def SEC("maps") exit_open_map =
{
        .type = BPF_MAP_TYPE_ARRAY,
        .key_size = sizeof(u32),
        .value_size = sizeof(long),
        .max_entries = 1,
};


struct bpf_map_def SEC("maps") fd_map =
{
        .type = BPF_MAP_TYPE_ARRAY,
        .key_size = sizeof(u32),
        .value_size = sizeof(u32),
        .max_entries = 1,
};


struct bpf_map_def SEC("maps") my_map =
{
        .type = BPF_MAP_TYPE_ARRAY,
        .key_size = sizeof(u32),
        .value_size = sizeof(u32),
        .max_entries = 1,
};



SEC("/tracepoint/syscalls/sys_enter_read")
int attach_open(struct syscalls_enter_open_args *ctx) {

        long key = 0;
        long val = bpf_map_lookup_elem(my_map, &key);

        if (val == ctx->filename_ptr){
                //success, I successfully read the filename from the map
                //update fd_map, will be used by the read bpf instumentation

                bpf_map_update_elem(exit_open_map, &key, &val, BPF_ANY);
        }
        return 0;
}




SEC("/tracepoint/syscalls/sys_enter_open")
int attach_open(struct syscalls_enter_open_args *ctx) {
	
	long key = 0;
 	long val = bpf_map_lookup_elem(enter_open_map, &key);

 	if (val == ctx->filename_ptr){
 		//success, I successfully read the filename from the map
		//update fd_map, will be used by the read bpf instumentation
		
		bpf_map_update_elem(exit_open_map, &key, &val, BPF_ANY);  
 	}
	return 0;
}


SEC("tracepoint/syscalls/sys_exit_open")
int trace_enter_exit(struct syscalls_exit_open_args *ctx)
{
	long key = 0;
        void *val = bpf_map_lookup_elem(exit_open_map, &key);

        if (val){
                //success, I this call corresponds to the filename from the map
                //update fd_map, will be used by the read bpf instumentation
                int fd = ctx->ret;
                bpf_map_update_elem(fd_map, &key, &fd, BPF_ANY);
        }

	return 0;
}
