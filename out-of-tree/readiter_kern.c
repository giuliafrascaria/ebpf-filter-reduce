#include <linux/skbuff.h>
#include <linux/netdevice.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include <linux/kernel.h>
#include "bpf_helpers.h"


#define _(P) ({typeof(P) val = 0; bpf_probe_read(&val, sizeof(val), &P); val;})
#define	UBUFFSIZE	9

struct bpf_map_def SEC("maps") my_read_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the buffer address from userland
};

struct bpf_map_def SEC("maps") result_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the average back to the user
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
}



SEC("kprobe/sys_read")
int bpf_prog16(struct pt_regs *ctx)
{
	// instantiate parameters
	void __user *to;
	int blen;

	//parse parameters from ctx
	to = (void __user *) PT_REGS_PARM2(ctx);
	blen = (int) PT_REGS_PARM3(ctx);

	//check buffer address
	__u32 key = 0;
	__u64 ** val;
	val = bpf_map_lookup_elem(&my_read_map, &key);

	if(!val)
	{
		char s[] = "error reading buffer value from map, read entry\n";
		bpf_trace_printk(s, sizeof(s)); 
		return 0;
	}

	if (to == *val)
	{
		char s[] = "sys_read %d to %lu mapped %d\n";
		bpf_trace_printk(s, sizeof(s), blen, (unsigned long) to, (unsigned long) *val);

	}

	return 0;
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

/*
SEC("kprobe/check_func_arg")
int bpf_prog23()
{
	char s[] = "func arg\n";
	bpf_trace_printk(s, sizeof(s));
	return 0;
}*/

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

	char s1[] = "entering modified copyout\n";
	bpf_trace_printk(s1, sizeof(s1));

	// instantiate parameters
	void __user *to;
	const void *from;
	int blen;

	//parse parameters from ctx
	to = (void __user *) PT_REGS_PARM1(ctx);
	from = (const void *) PT_REGS_PARM2(ctx);
	blen = PT_REGS_PARM3(ctx);

	//check buffer address
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

	if (to == *val)
	{
		char s2[] = "copyout to 0x%p, ul %lu len %d\n";
		bpf_trace_printk(s2, sizeof(s2), to, (unsigned long) to, blen);

		char userbuff[UBUFFSIZE];

		//char singlechar;
		//singlechar = (char) _(from);
		//int ret;
		//ret = bpf_probe_read(userbuff, sizeof(userbuff), from);

		int ret;
		ret = bpf_probe_read_str(userbuff, sizeof(userbuff), from);

		char s[] = "full buffer %s\n";
		bpf_trace_printk(s, sizeof(s), userbuff);

		
		unsigned long sum = 0;
		char curr[3];
		unsigned long num = 0; // need initialization or verifier complains on strtol
		u64 base = 10;
		unsigned long elems = 3;

		for (int i = 0; i < UBUFFSIZE; i = i+3)
		{
			ret = bpf_probe_read_str(curr, 3, userbuff+i);
			
			if (curr != NULL)
			{
				int res = bpf_strtoul(curr, sizeof(curr), base, &num);
				if (res < 0)
				{
					return 1;
				}
			}

			char s3[] = "copyout char %s converted to %d\n";
			bpf_trace_printk(s3, sizeof(s3), curr, num);

			sum = sum + num;
		}

		unsigned long avg = sum/elems;
		
		char s4[] = "sum of numbers is %lu, avg is %lu\n";
		bpf_trace_printk(s4, sizeof(s4), sum, avg);

		bpf_map_update_elem(&result_map, &key, &avg, BPF_ANY);

		
		char mystring[] = "42";
		bpf_probe_write_user((void *) to, mystring, sizeof(mystring));

		//now this works, but then to is overwritten by the real function copyout so it is not returned to user
		//if only I could get return override, that highjacks execution T_T
		char s5[] = "now to is %s\n";
		bpf_trace_printk(s5, sizeof(s5), to);
		//bpf_probe_write_user((void *) from, (char*) &avg, sizeof(avg));

		//unsigned long rc = 1;
		//bpf_override_return(ctx, rc);
	}

	return 0;
}


SEC("kprobe/copyout")
int bpf_prog12(struct pt_regs *ctx)
{

	char s1[] = "entering real copyout\n";
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

	if ( to == *val)
	{
		char s2[] = "copyout to 0x%p, ul %lu len %d\n";
		bpf_trace_printk(s2, sizeof(s2), to, (unsigned long) to, len);

		char userbuff[UBUFFSIZE];

		int ret;
		ret = bpf_probe_read(userbuff, sizeof(userbuff), from);

		//bpf_probe_read(userbuff, sizeof(userbuff), (char *) from);

		if (ret != 0) 
		{
			char serr[] = "error reading char from kernel buff\n";
			bpf_trace_printk(serr, sizeof(serr));
			return 0;
		}
		
		char s[] = "copyout to 0x%p from 0x%p char %c\n";
		bpf_trace_printk(s, sizeof(s), to, from, userbuff[0]);
		
	
	}
	return 0;
	
}


SEC("kprobe/__vfs_read")
int bpf_prog11(struct pt_regs *ctx)
{
	void __user *to;
	int len;

	to = (void __user *) PT_REGS_PARM2(ctx);
	len = PT_REGS_PARM3(ctx);

	//check buffer address
	__u32 key = 0;
	__u64 ** val;
	val = bpf_map_lookup_elem(&my_read_map, &key);

	if(!val)
	{
		char s[] = "error reading buffer value from map, read entry\n";
		bpf_trace_printk(s, sizeof(s)); 
		return 0;
	}

	if (len == 9 && to == *val)
	{
		char s[] = "__vfs_read %d\n";
		bpf_trace_printk(s, sizeof(s), len);
	}

	return 0;
}

SEC("kprobe/vfs_read")
int bpf_vfs_read(struct pt_regs *ctx)
{
	void __user *to;
	int len;

	to = (void __user *) PT_REGS_PARM2(ctx);
	len = PT_REGS_PARM3(ctx);

	//check buffer address
	__u32 key = 0;
	__u64 ** val;
	val = bpf_map_lookup_elem(&my_read_map, &key);

	if(!val)
	{
		char s[] = "error reading buffer value from map, read entry\n";
		bpf_trace_printk(s, sizeof(s)); 
		return 0;
	}

	if (len == 9 && to == *val)
	{
		char s[] = "vfs_read %d\n";
		bpf_trace_printk(s, sizeof(s), len);
	}

	return 0;
}

SEC("kprobe/ksys_read")
int bpf_ksys_read(struct pt_regs *ctx)
{
	void __user *to;
	int len;

	to = (void __user *) PT_REGS_PARM2(ctx);
	len = PT_REGS_PARM3(ctx);

	//check buffer address
	__u32 key = 0;
	__u64 ** val;
	val = bpf_map_lookup_elem(&my_read_map, &key);

	if(!val)
	{
		char s[] = "error reading buffer value from map, read entry\n";
		bpf_trace_printk(s, sizeof(s)); 
		return 0;
	}

	if (len == 9 && to == *val)
	{
		char s[] = "ksys_read %d\n";
		bpf_trace_printk(s, sizeof(s), len);
	}

	return 0;
}

char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;