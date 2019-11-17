// part of the code is taken from the sample in linux kernel syscall_tp_kern.

#include <uapi/linux/bpf.h>
#include "bpf_helpers.h"

struct syscalls_enter_open_args {
	unsigned long long unused;
	long syscall_nr;
	long filename_ptr;
	long flags;
	long mode;
};

struct bpf_map_def SEC("maps") enter_open_map = {
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u32),
	.max_entries = 1,
};
