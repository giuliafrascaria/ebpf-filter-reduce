// SPDX-License-Identifier: GPL-2.0

#define _GNU_SOURCE
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sched.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <linux/bpf.h>
#include <locale.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <sys/wait.h>

#include <bpf.h>
#include <libbpf.h>
#include "bpf_load.h"
//#include "vmlinux.h"
#include <trace_helpers.h>



int main(int argc, char **argv)
{
	char filename[256];
	int ret;

	snprintf(filename, sizeof(filename), "%s_kern.o", argv[0]);
	printf("eBPF file to be loaded is : %s \n", filename);

	struct bpf_object *obj;
	int prog_fd, err;
	const char * prog_name[] = {
		"fentry/copyout_fmod_test",
		"fmod_ret/copyout_fmod_test",
		"fexit/copyout_fmod_test",
	};

	//obj = bpf_object__open(extension);
	/*int prog_fd;
	if (bpf_prog_load(filename, BPF_PROG_TYPE_TRACING, &obj, &prog_fd))
	{
		printf("error reading bpf instrumentation");
		return 1;
	}*/


	obj = bpf_object__open(filename);
	
	printf("opened at %p\n", obj);

	err = bpf_object__load(obj);
	
	printf("loaded with error code %d\n", err);

    int fd = open("f", O_RDONLY);
	if (fd == -1)
	{
		printf("error open file\n");
		exit(EXIT_FAILURE);
	}

 	char * buf = malloc(50);

	ssize_t readbytes = read(fd, buf, 42);	//42 read size will trigger the fentry test call
	printf("retval = %d\n", (int) readbytes);
	close(fd);
	free(buf);

	//read_trace_pipe();

	return 0;
}
