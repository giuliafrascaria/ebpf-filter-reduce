gcc cpustat_user.c ../common/bpf_load.c ~/ebpf/libbpf/src/libbpf.a -I/home/giogge/ebpf/libbpf/include/uapi/ -I/home/giogge/ebpf/libbpf/src/ -I../common/ -lelf -o cpustat
