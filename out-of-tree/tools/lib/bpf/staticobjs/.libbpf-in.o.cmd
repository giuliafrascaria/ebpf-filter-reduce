cmd_staticobjs/libbpf-in.o :=  ld -r -o staticobjs/libbpf-in.o  staticobjs/libbpf.o staticobjs/bpf.o staticobjs/nlattr.o staticobjs/btf.o staticobjs/libbpf_errno.o staticobjs/str_error.o staticobjs/netlink.o staticobjs/bpf_prog_linfo.o staticobjs/libbpf_probes.o staticobjs/xsk.o staticobjs/hashmap.o staticobjs/btf_dump.o