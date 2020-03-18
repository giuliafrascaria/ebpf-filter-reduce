## eBPF workflow

### compile time

make sure that the bpf bytecode is consistent with what I ha in mind

- llvm objdump to inspect the object file of bpf instructions
- it is possible to compile in bpf assembly instead of bpf bytecode, easier to debug 

### load time

Now that we have the obj we jit compile to execute, but first we need to pass the verifier

- the verifier rejection debug information can be inspected in libbpf, bpftools
- (also other tools but mostly for networking)

the verifier tries to check for
- syntax
- too long
- backward loops
...

potential risk of out of bound access, but the verifier doesn't carer. If logically there is a risk of out of bound access the verifier will fail anyway!



### bpftool

bpftool is a package meant for inspection and manipulation of bpf programs and maps. It is not packaged in standard ubuntu and debian so it needs to be compiled from the linux source. The source code is located in /tools/bpf/bpftool/ in the kernel source and can be compiled with make

https://www.mankier.com/8/bpftool