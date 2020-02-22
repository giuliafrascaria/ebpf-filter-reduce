## BPF potential and limitations

Traditionally, BPF has been used for packet filtering, tracing and monitoring in the kernel.
For this reason and the fact that it is meant to run in-kernel, after undergoing a formal verification step, BPF is deliberately not Turing-complete and has restricted functionality.

In order to understand what can be ported to storage and what needs to be implemented from scratch, I had to test the current BPF limitations for my use case.