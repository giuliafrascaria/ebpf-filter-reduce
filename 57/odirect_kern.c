#include <linux/skbuff.h>
#include <linux/netdevice.h>
#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/ptrace.h>
#include <linux/kernel.h>
#include <linux/iomap.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>


#define _(P) ({typeof(P) val = 0; bpf_probe_read(&val, sizeof(val), &P); val;})
#define PROG(F) SEC("kprobe/"__stringify(F)) int bpf_func_##F
//#define	UBUFFSIZE	2048
#define	UBUFFSIZE	256

struct bpf_map_def SEC("maps") my_read_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the buffer address from userland
};


struct bpf_map_def SEC("maps") counter_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the buffer address from userland
};


struct bpf_map_def SEC("maps") str_counter_map =
{
	.type = BPF_MAP_TYPE_ARRAY,
	.key_size = sizeof(u32),
	.value_size = sizeof(u64),
	.max_entries = 1,	//used to pass the buffer address from userland
};


SEC("kprobe/iomap_dio_rw")
int bpf_readahead(struct pt_regs *ctx)
{

	char s[] = "iomap_dio_rw\n";
	bpf_trace_printk(s, sizeof(s)); 

	return 0;
}

SEC("kprobe/iomap_apply")
int bpf_iomap_apply(struct pt_regs *ctx)
{

	char s[] = "iomap_apply\n";
	bpf_trace_printk(s, sizeof(s)); 

	return 0;
}

SEC("kprobe/iomap_dio_actor")
int bpf_iomapdio_actor(struct pt_regs *ctx)
{

	struct iomap *iomap;
	iomap = (void *) PT_REGS_PARM5(ctx);

	if(iomap != NULL)
	{
		char s[] = "iomap_dio_actor %d\n";

		u16 maptype;
		//int ret;
		maptype = _(iomap->type); // returning 2, IOMAP_MAPPED
		//ret = bpf_probe_read(&maptype, sizeof(maptype), iomap->type);
		bpf_trace_printk(s, sizeof(s), maptype); 
	}
	return 0;
}

SEC("kprobe/iomap_dio_bio_actor")
int bpf_iomap_actor(struct pt_regs *ctx)
{

	struct iomap *iomap;
	iomap = (void *) PT_REGS_PARM5(ctx);

	if(iomap != NULL)
	{
		char s[] = "iomap_dio_bio_actor %d\n";

		u16 maptype;
		//int ret;
		maptype = _(iomap->type); // returning 2, IOMAP_MAPPED
		//ret = bpf_probe_read(&maptype, sizeof(maptype), iomap->type);
		bpf_trace_printk(s, sizeof(s), maptype); 
	}



	return 0;
}

/*SEC("kprobe/iomap_dio_inline_actor")
int bpf_iomapinline_actor(struct pt_regs *ctx)
{

	char s[] = "iomap_dio_inline_actor\n";
	bpf_trace_printk(s, sizeof(s)); 

	return 0;
}*/


SEC("kprobe/iov_iter_npages")
int bpf_iov_iter(struct pt_regs *ctx)
{

	char s[] = "iov_iter_npages\n";
	bpf_trace_printk(s, sizeof(s)); 

	return 0;
}


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;