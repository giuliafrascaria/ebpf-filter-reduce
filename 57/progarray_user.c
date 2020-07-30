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
#include <assert.h>
#include <bpf.h>
#include "bpf_load.h"


#define MIN_FUNC 3
#define MIN_FUNC_PROG_FD (prog_fd[0])
#define PROG_ARRAY_FD (map_fd[2])


int main(int argc, char **argv)
{
	char filename[256];
	int ret, err, id, fkey = MIN_FUNC;

	snprintf(filename, sizeof(filename), "%s_kern.o", argv[0]);
	printf("eBPF file to be loaded is : %s \n", filename);

	if (load_bpf_file(filename)) {
		printf("%s", bpf_log_buf);
		return 1;
	}

	struct bpf_prog_info info = {};
	uint32_t info_len = sizeof(info);

    /* Test fd array lookup which returns the id of the bpf_prog */
	err = bpf_obj_get_info_by_fd(MIN_FUNC_PROG_FD, &info, &info_len);
	assert(!err);
	err = bpf_map_lookup_elem(PROG_ARRAY_FD, &fkey, &id);
	assert(!err);
	assert(id == info.id);


	int fd = open("f", O_RDONLY);
	if (fd == -1)
	{
		printf("error open file\n");
		exit(EXIT_FAILURE);
	}

 	char * buf = malloc(4096);

	__u32 key = 0;
	printf("buffer on user side = %lu\n", (unsigned long) buf);	
	if (bpf_map_update_elem(map_fd[0], &key, &buf, BPF_ANY) != 0) 
	{
		fprintf(stderr, "map_update failed: %s\n", strerror(errno));
		return 1;
    }

	ssize_t readbytes = read(fd, buf, 256);
	printf("retval = %d\n", (int) readbytes);


	unsigned long avg;
	bpf_map_lookup_elem(map_fd[1], &key, &avg);

	printf("avg = %lu, on buffer %s\n", avg, buf);

	printf("loaded module OK.\nCheck the trace pipe to see the output : sudo cat /sys/kernel/debug/tracing/trace_pipe \n");

	close(fd);
	free(buf);
	return 0;
}
