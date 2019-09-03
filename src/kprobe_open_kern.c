#include <uapi/linux/bpf.h>
#include <linux/version.h>
#include <linux/bpf_perf_event.h>
#include <linux/types.h>
#include "bpf_helpers.h"


SEC("Kprobe/do_sys_open")
int bpf_prog1(struct pt_regs *ctx)
{
  //long do_sys_open(int dfd, const char __user *filename, int flags, umode_t mode)
  char buf[64];
  bpf_probe_read(&buf, sizeof(buf), (void *)PT_REGS_PARM1(ctx));
  bpf_trace_printk(buf, 64);

  return 0;

}


char _license[] SEC("license") = "GPL";
__u32 _version SEC("version") = LINUX_VERSION_CODE;
