
- https://github.com/torvalds/linux/blob/v4.15/samples/bpf/sampleip_kern.c
sample instruction pointer frequency of use. Is if a perf_event bpf program
```
SEC("perf_event")
|
|---> input is struct bpf_perf_event_data ctx
      |
      |---> defined in /include/uapi/linux/bpf_perf_event.h
            struct bpf_perf_event_data {
              bpf_user_pt_regs_t regs;
              __u64 sample_period;
            };
            |
            |----> bpf_user_pt_regs_t defined in /arch/arm64/include/uapi/asm/bpf_perf_event.h
                  typedef struct user_pt_regs bpf_user_pt_regs_t;
                  |
                  |----> struct user_pt_regs is defined in /arch/arm64/include/uapi/asm/ptrace.h
                  struct user_pt_regs {
                    __u64		regs[31];
                    __u64		sp;
                    __u64		pc;
                    __u64		pstate;
                    };

                  depending on the architecture will be in different branches of arch

      in bpf_helpers.h,


```
#after compiling with 4.15.9

tracex1_kern has undeclared reference to cr3_addr_mask

/arch/x86/include/asm/processor.h
|
|-------->
