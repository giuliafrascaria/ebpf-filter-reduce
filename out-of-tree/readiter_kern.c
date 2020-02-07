#include <linux/skbuff.h>
#include <linux/netdevice.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include "bpf_helpers.h"


#define _(P) ({typeof(P) val = 0; bpf_probe_read(&val, sizeof(val), &P); val;})
#define	UBUFFSIZE	4

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
	char s[] = "Where i'd actually want to be\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

SEC("kprobe/copyout_bpf")
int bpf_prog5(struct pt_regs *ctx)
{

	char s1[] = "entering copyout\n";
	bpf_trace_printk(s1, sizeof(s1));

	

	void __user *to;
	void *from;
	int len;
	to = PT_REGS_PARM1(ctx);
	from = PT_REGS_PARM2(ctx);
	len = PT_REGS_PARM3(ctx);

	char s2[] = "copyout to 0x%p from 0x%p len %d\n";
	bpf_trace_printk(s2, sizeof(s2), to, from, len);

	char userbuff[UBUFFSIZE];
	int ret;
	bpf_probe_read(userbuff, sizeof(userbuff), from);

	/*if (ret != 0) 
	{
		char serr[] = "error reading char from kernel buff\n";
		bpf_trace_printk(serr, sizeof(serr));
		return 0;
	}*/

	char s[] = "copyout to 0x%p from 0x%p char %c\n";
	bpf_trace_printk(s, sizeof(s), to, from, userbuff);
	return 0;
}

SEC("kprobe/bpf_probe_read")
int bpf_prog6()
{
	char s[] = "bpf_probe_read\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}

char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;