## lathist
```
> sudo ./lathist
sh: echo: I/O error
failed to open event trace_preempt_off
```
## trace_output
trace output uses perf array event map, which is what I'm trying to use myself. Over the period of maybe 1 second the calls to sys_write are monitored with a kprobe

every time a kprobe is triggered, the function bpf_perf_event_output is called. this function has the following signature 

```
bpf_perf_event_output (void *ctx, void *map, unsigned long long flags, void *data, int size);
```

on the user side, a function called print_bpf_output is called. It has the same signature and it is called to initialize a perf_buffer