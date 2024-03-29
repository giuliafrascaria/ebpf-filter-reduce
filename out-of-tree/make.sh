#!/bin/bash
#clang -target bpf , see https://www.kernel.org/doc/html/latest/bpf/bpf_devel_QA.html#q-clang-flag-for-target-bpf
# also : https://stackoverflow.com/questions/56975861/error-compiling-ebpf-c-code-out-of-kernel-tree

C_FLAGS="-Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -Wno-gnu-variable-sized-type-not-at-end -Wno-address-of-packed-member -Wno-tautological-compare -Wno-unknown-warning-option"

function magic_make {
DEFAULT=$1
KERN="$DEFAULT"_kern
USER="$DEFAULT"_user

clang -nostdinc -isystem `clang -print-file-name=include` \
	-D__KERNEL__ -D__ASM_SYSREG_H -D__TARGET_ARCH_x86 \
	$C_FLAGS \
	-Icommon/ \
	-include /usr/src/linux-headers-`uname -r`/include/linux/kconfig.h \
	-I/usr/src/linux-headers-`uname -r`/include/ \
	-I/usr/src/linux-headers-`uname -r`/include/uapi/ \
	-I/usr/src/linux-headers-`uname -r`/include/generated/uapi/ \
	-I/usr/src/linux-headers-`uname -r`/arch/x86/include \
	-I/usr/src/linux-headers-`uname -r`/arch/x86/include/uapi/ \
	-I/usr/src/linux-headers-`uname -r`/arch/x86/include/generated/ \
	-I/usr/src/linux-headers-`uname -r`/arch/x86/include/generated/uapi/ \
    -I/usr/src/linux-headers-`uname -r`/tools/lib/ \
    -include asm_goto_workaround.h \
	-O2 -emit-llvm -c "$KERN".c -o -| llc -march=bpf -filetype=obj -o "compiled/$KERN".o

gcc "$USER".c bpf_load.c ~/thesis/ebpf-experiments/out-of-tree/tools/lib/bpf/libbpf.a -iquote -I/home/giogge/thesis/libbpf/src/ \
 -I./usr/include -I./tools/lib/bpf/ -I./tools/testing/selftests/bpf/ -I./tools/lib/ \
-I./tools/include -I./tools/perf -I./tools/perf/util -I./tools/perf/tests -lelf -o compiled/$DEFAULT

}

targets=( override_exec procfs_override tailcall bpfbench tracex1 readiter hellotrace readbuff buffermap proberead mmap strtol)

for t in "${targets[@]}" ; do
	echo "making ...$t"
	magic_make $t
done
