#
# Makefile for out-of-tree building eBPF programs
#  similar to kernel/samples/bpf/
#
# Still depend on a kernel source tree.
#
TARGETS := hellotrace
TARGETS += tracex1
TARGETS += cpustat
TARGETS += open_tp
TARGETS += passfd
TARGETS += readbuff
TARGETS += buffermap
TARGETS += readiter


# Targets that use the library bpf/libbpf
### TARGETS_USING_LIBBPF += xdp_monitor_user

TOOLS_PATH = tools

# Files under kernel/samples/bpf/ have a name-scheme:
# ---------------------------------------------------
# The eBPF program is called xxx_kern.c. This is the restricted-C
# code, that need to be compiled with LLVM/clang, to generate an ELF
# binary containing the eBPF instructions.
#
# The userspace program called xxx_user.c, is a regular C-code
# program.  It need two external components from kernel tree, from
# samples/bpf/ and tools/lib/bpf/.
#
# 1) When loading the ELF eBPF binary is uses the API load_bpf_file()
#    via "bpf_load.h" (compiles against a modified local copy of
#    kernels samples/bpf/bpf_load.c).
#    (TODO: This can soon be changed, and use loader from tools instead)
#
# 2) The API for interacting with eBPF comes from tools/lib/bpf/bpf.h.
#    A library file under tools is compiled and static linked.
#

TARGETS_ALL = $(TARGETS) $(TARGETS_PCAP)

# Generate file name-scheme based on TARGETS
KERN_SOURCES = ${TARGETS_ALL:=_kern.c}
USER_SOURCES = ${TARGETS_ALL:=_user.c}
KERN_OBJECTS = ${KERN_SOURCES:.c=.o}
USER_OBJECTS = ${USER_SOURCES:.c=.o}

# Notice: the kbuilddir can be redefined on make cmdline
kbuilddir ?= /lib/modules/$(shell uname -r)/build/
KERNEL=$(kbuilddir)

CFLAGS := -g -O2 -Wall

# Local copy of include/linux/bpf.h kept under ./kernel-usr-include
#
CFLAGS += -I./kernel-usr-include/
##CFLAGS += -I$(KERNEL)/usr/include
#
# Interacting with libbpf
CFLAGS += -I$(TOOLS_PATH)/lib

LDFLAGS= -lelf

# Objects that xxx_user program is linked with:
OBJECT_LOADBPF = bpf_load.o
OBJECTS = $(OBJECT_LOADBPF)
#
# The static libbpf library
LIBBPF = $(TOOLS_PATH)/lib/bpf/libbpf.a

# Allows pointing LLC/CLANG to another LLVM backend, redefine on cmdline:
#  make LLC=~/git/llvm/build/bin/llc CLANG=~/git/llvm/build/bin/clang
LLC ?= llc
CLANG ?= clang

CC = gcc

NOSTDINC_FLAGS := -nostdinc -isystem $(shell $(CC) -print-file-name=include)

# TODO: can we remove(?) copy of uapi/linux/bpf.h stored here: ./tools/include/
# LINUXINCLUDE := -I./tools/include/
#
# bpf_helper.h need newer version of uapi/linux/bpf.h
# (as this git-repo use new devel kernel features)
LINUXINCLUDE := -I./kernel/include
#
LINUXINCLUDE += -I$(KERNEL)/arch/x86/include
LINUXINCLUDE += -I$(KERNEL)/arch/x86/include/generated/uapi
LINUXINCLUDE += -I$(KERNEL)/arch/x86/include/generated
LINUXINCLUDE += -I$(KERNEL)/include
LINUXINCLUDE += -I$(KERNEL)/arch/x86/include/uapi
LINUXINCLUDE += -I$(KERNEL)/include/uapi
LINUXINCLUDE += -I$(KERNEL)/include/generated/uapi
LINUXINCLUDE += -include $(KERNEL)/include/linux/kconfig.h
LINUXINCLUDE += -include asm_goto_workaround.h
#LINUXINCLUDE += -I$(KERNEL)/tools/lib
EXTRA_CFLAGS=-Werror

all: dependencies $(TARGETS_ALL) $(KERN_OBJECTS) $(CMDLINE_TOOLS)

clean:
	@find . -type f \
		\( -name '*~' \
		-o -name '*.ll' \
		-o -name '*.bc' \
		-o -name 'core' \) \
		-exec rm -vf '{}' \;
	rm -f $(OBJECTS)
	rm -f $(TARGETS_ALL)
	rm -f $(KERN_OBJECTS)
	rm -f $(USER_OBJECTS)
	make -C $(TOOLS_PATH)/lib/bpf clean

# Most xxx_user program still depend on old bpf_load.c
$(OBJECT_LOADBPF): bpf_load.c bpf_load.h
	$(CC) $(CFLAGS) -o $@ -c $<

LIBBPF_SOURCES  = $(TOOLS_PATH)/lib/bpf/*.c

# New ELF-loaded avail in libbpf (in bpf/libbpf.c)
$(LIBBPF): $(LIBBPF_SOURCES) $(TOOLS_PATH)/lib/bpf/Makefile
	make -C $(TOOLS_PATH)/lib/bpf/ all

# Compiling of eBPF restricted-C code with LLVM
#  clang option -S generated output file with suffix .ll
#   which is the non-binary LLVM assembly language format
#   (normally LLVM bitcode format .bc is generated)
#
# Use -Wno-address-of-packed-member as eBPF verifier enforces
# unaligned access checks where necessary
#
$(KERN_OBJECTS): %.o: %.c bpf_helpers.h Makefile
	$(CLANG) -S $(NOSTDINC_FLAGS) $(LINUXINCLUDE) $(EXTRA_CFLAGS) \
	    -D__KERNEL__ -D__ASM_SYSREG_H \
	    -D__BPF_TRACING__ \
	    -Wall \
	    -Wno-unused-value -Wno-pointer-sign \
	    -D__TARGET_ARCH_$(ARCH) \
	    -Wno-compare-distinct-pointer-types \
	    -Wno-gnu-variable-sized-type-not-at-end \
	    -Wno-tautological-compare \
	    -Wno-unknown-warning-option \
	    -Wno-address-of-packed-member \
	    -O2 -emit-llvm -c $< -o ${@:.o=.ll}
	$(LLC) -march=bpf -filetype=obj -o $@ ${@:.o=.ll}

$(TARGETS): %: %_user.c $(OBJECTS) $(LIBBPF) Makefile bpf_util.h
	$(CC) $(CFLAGS) $(OBJECTS) $(LDFLAGS) -o $@ $<  $(LIBBPF)

# Targets that links with libpcap
$(TARGETS_PCAP): %: %_user.c $(OBJECTS) $(LIBBPF) Makefile bpf_util.h
	$(CC) $(CFLAGS) $(OBJECTS) $(LDFLAGS) -o $@ $<  $(LIBBPF) -lpcap

$(CMDLINE_TOOLS): %: %.c $(OBJECTS) $(LIBBPF) Makefile $(COMMON_H) bpf_util.h
	$(CC) -g $(CFLAGS) $(OBJECTS) $(LDFLAGS) -o $@ $<  $(LIBBPF)