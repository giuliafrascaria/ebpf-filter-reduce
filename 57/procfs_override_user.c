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
#include <time.h>
#include <bpf.h>
#include "bpf_load.h"
#include <libbpf.h>





int main(int argc, char **argv)
{
	char filename[256];
	int ret;

	snprintf(filename, sizeof(filename), "%s_kern.o", argv[0]);
	printf("eBPF file to be loaded is : %s \n", filename);

	struct bpf_object *obj;

	obj = bpf_object__open(filename);
	ret = bpf_object__load(obj);
	//ret = load_bpf_file(filename);
	printf("bpf obj load return: %d\n", ret);
	if (ret) 
    {
		printf("%s", bpf_log_buf);
		return 1;
	}

    char buf[5000];

	int fd = open("/proc/helloworld", O_RDONLY);
	if(fd == -1)
	{
		printf("failed to open file\n");
		return -1;
	}

	ssize_t readbytes = read(fd, buf, 4096);
	//puts(buf);

	printf("read size %ld\n", readbytes);

	return 0;


}
