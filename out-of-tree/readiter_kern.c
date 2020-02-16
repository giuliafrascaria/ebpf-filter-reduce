#include <linux/skbuff.h>
#include <linux/netdevice.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include "bpf_helpers.h"


#define _(P) ({typeof(P) val = 0; bpf_probe_read(&val, sizeof(val), &P); val;})
#define	UBUFFSIZE	4

struct bpf_map_def SEC("maps") my_read_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the buffer address from userland
};

struct bpf_map_def SEC("maps") debug_map = {
	.type = BPF_MAP_TYPE_PERF_EVENT_ARRAY,
	.key_size = sizeof(int),
	.value_size = sizeof(int),
	.max_entries = 64,
};

/*
size_t copy_page_to_iter_bpf(struct page *page, size_t offset, size_t bytes,
			 struct iov_iter *i)
{
	if (unlikely(!page_copy_sane(page, offset, bytes)))
		return 0;
	if (i->type & (ITER_BVEC|ITER_KVEC)) {
		void *kaddr = kmap_atomic(page);
		size_t wanted = copy_to_iter_bpf(kaddr + offset, bytes, i);
		kunmap_atomic(kaddr);
		return wanted;
	} else if (unlikely(iov_iter_is_discard(i)))
		return bytes;
	else if (likely(!iov_iter_is_pipe(i)))
		return copy_page_to_iter_iovec_bpf(page, offset, bytes, i);
	else
		return copy_page_to_iter_pipe(page, offset, bytes, i);
}
EXPORT_SYMBOL(copy_page_to_iter_bpf);
}*/


SEC("kprobe/copy_page_to_iter_bpf")
int bpf_prog1()
{
	char s[] = "copy_page_to_iter\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/ext4_file_read_iter")
int bpf_prog2()
{
	char s[] = "ext4 file read\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/generic_file_read_iter")
int bpf_prog9()
{
	char s[] = "generic file read\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/copy_page_to_iter_pipe")	//not here 
int bpf_prog3()
{
	char s[] = "copy_page_to_iter_pipe\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/_copy_to_iter_bpf")
int bpf_prog4()
{
	char s[] = "_copy_to_iter_bpf\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/copy_to_iter_bpf")
int bpf_prog5()
{
	char s[] = "copy_to_iter_bpf\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/copy_page_to_iter_iovec_bpf")
int bpf_prog6()
{
	char s[] = "copy_page_to_iter_iovec\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/copyout_bpf")
int bpf_prog7(struct pt_regs *ctx)
{

	char s1[] = "entering copyout\n";
	bpf_trace_printk(s1, sizeof(s1));

	void __user *to;
	const void *from;
	int len;
	to = (void __user *) PT_REGS_PARM1(ctx);
	from = (const void *) PT_REGS_PARM2(ctx);
	len = PT_REGS_PARM3(ctx);


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
	bpf_trace_printk(str2, sizeof(str2), (unsigned long) to, (unsigned long) *val);


	char s2[] = "copyout to 0x%p, ul %lu len %d\n";
	bpf_trace_printk(s2, sizeof(s2), to, (unsigned long) to, len);

	char userbuff[UBUFFSIZE];

	char singlechar;
	singlechar = (char) _(from);

	//int ret;
	//ret = bpf_probe_read(userbuff, 16, from);

	//bpf_probe_read(userbuff, sizeof(userbuff), (char *) from);

	//if (ret != 0) 
	//{
	//	char serr[] = "error reading char from kernel buff\n";
	//	bpf_trace_printk(serr, sizeof(serr));
	//	return 0;
	//}
	if (singlechar == '1')
	{
		char s[] = "copyout to 0x%p from 0x%p char %c\n";
		bpf_trace_printk(s, sizeof(s), to, from, singlechar);
	}
	return 0;
}

/*
SEC("kretprobe/copyout_bpf")
int bpf_prog10(struct pt_regs *ctx)
{

	char s1[] = "exiting copyout\n";
	bpf_trace_printk(s1, sizeof(s1));

	return 0;
}

SEC("kprobe/bpf_probe_read")
int bpf_prog8()
{
	char s[] = "bpf_probe_read\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/_copy_to_user")
int bpf_prog10()
{
	char s[] = "vfs_read\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}*/

SEC("kprobe/__vfs_read")
int bpf_prog11(struct pt_regs *ctx)
{

	void __user *to;
	//from;
	int len;
	to = (void __user *) PT_REGS_PARM2(ctx);
	//from = (const void *) PT_REGS_PARM3(ctx);
	len = PT_REGS_PARM3(ctx);

	if (len == 15)
	{
		char s[] = "__vfs_read %d %p\n";
		bpf_trace_printk(s, sizeof(s), len, to);
	}


	return 0;
}

char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;