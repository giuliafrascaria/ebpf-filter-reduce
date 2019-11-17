/* Copyright (c) 2017 Facebook
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of version 2 of the GNU General Public
 * License as published by the Free Software Foundation.
 */
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <signal.h>
#include <linux/bpf.h>
#include <string.h>
#include <linux/perf_event.h>
#include <errno.h>
#include <assert.h>
#include <stdbool.h>
#include <sys/resource.h>
#include "libbpf.h"
#include "bpf_load.h"

/* This program verifies bpf attachment to tracepoint sys_enter_* and sys_exit_*.
 * This requires kernel CONFIG_FTRACE_SYSCALLS to be set.
 */


static int test(char *filename)
{

	/* current load_bpf_file has perf_event_open default pid = -1
	 * and cpu = 0, which permits attached bpf execution on
	 * all cpus for all pid's. bpf program execution ignores
	 * cpu affinity.
	 */
	/* trigger some "open" operations */
	int fd = open(filename, O_RDONLY);
	if (fd < 0) {
		fprintf(stderr, "open failed: %s\n", strerror(errno));
		return 1;
	}


	char * buf = malloc(150*sizeof(char));
	ssize_t size = read(fd, buf, 20);

	close(fd);

	return 0;
}

int main(int argc, char **argv)
{
	char filename[8] = "numfile";

	return test(filename);
}
