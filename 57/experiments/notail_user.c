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
#include <time.h>
#include <sys/resource.h>
#include <sys/wait.h>
#include <assert.h>
#include <bpf.h>
#include "bpf_load.h"
#include <libbpf.h>


#define MIN_FUNC 1
#define MIN_FUNC_PROG_FD (prog_fd[0])
#define PROG_ARRAY_FD (map_fd[2])


struct timespec diff(struct timespec start, struct timespec end)
{
        struct timespec temp;
        if ((end.tv_nsec-start.tv_nsec < 0 ) || ((end.tv_sec > start.tv_sec) && (end.tv_nsec-start.tv_nsec > 0)) ) {
                temp.tv_sec = end.tv_sec-start.tv_sec-1;
                temp.tv_nsec = 1000000000 + 1000000000*temp.tv_sec +end.tv_nsec-start.tv_nsec;
        } else {
                temp.tv_sec = end.tv_sec-start.tv_sec;
                temp.tv_nsec = end.tv_nsec-start.tv_nsec;
        }
        return temp;
}


int main(int argc, char **argv)
{
    // all the program complexity of the bpf extension is in a single program
	char filename[256];
	int ret, err, id, fkey = MIN_FUNC;
	struct rlimit r = {RLIM_INFINITY, RLIM_INFINITY};

	snprintf(filename, sizeof(filename), "%s_kern.o", argv[0]);
	//printf("eBPF file to be loaded is : %s \n", filename);
	setrlimit(RLIMIT_MEMLOCK, &r);

	if (argc != 2)
    {
        printf("usage: ./notail niters\nn: number iterations\n");
        return 1;
    }

    int i;
    i = atoi(argv[1]);

    int ret1, ret2, ret3, ret4;
    struct timespec tp1, tp2, tp3, tp4;
    clockid_t clk_id1, clk_id2, clk_id3, clk_id4;
    clk_id1 = CLOCK_MONOTONIC;
    clk_id2 = CLOCK_BOOTTIME;

    ret1 = clock_gettime(clk_id1, &tp1);
	if (load_bpf_file(filename)) {
		printf("%s", bpf_log_buf);
		return 1;
	}
    ret2 = clock_gettime(clk_id1, &tp2);
	if (ret1 < 0)
	{
		printf("failed clock 1\n");
	}
	if (ret2 < 0)
	{
		printf("failed clock 2\n");
	}

	struct timespec timediff = diff(tp1, tp2);
    //printf("1,%lu\n", timediff.tv_nsec);

	
	// open file and read to trigger the instrumentation
	int fd = open("randnum", O_RDONLY);
	if (fd == -1)
	{
		printf("error open file\n");
		exit(EXIT_FAILURE);
	}

 	char * buf = malloc(4096);

	__u32 key = 0;
	//printf("buffer on user side = %lu\n", (unsigned long) buf);	
	if (bpf_map_update_elem(map_fd[0], &key, &buf, BPF_ANY) != 0) 
	{
		fprintf(stderr, "map_update failed: %s\n", strerror(errno));
		return 1;
    }

	ret3 = clock_gettime(clk_id1, &tp3);
	for (int iters = 0; iters < i; iters++)
	{
		ssize_t readbytes = read(fd, buf, 4096);
		//printf("retval = %d\n", (int) readbytes);
		//unsigned long elems;
		//bpf_map_lookup_elem(map_fd[1], &key, &elems);
		if(readbytes < 0)
		{
			printf("read error\n");
			return 1;
		}
		
		
		//printf("counted %lu elems\n", elems);
	}
	ret4 = clock_gettime(clk_id1, &tp4);
	if (ret3 < 0)
	{
		printf("failed clock 3\n");
	}
	if (ret4 < 0)
	{
		printf("failed clock 4\n");
	}

	struct timespec timediff1 = diff(tp3, tp4);
	printf("%lu,%lu\n", timediff.tv_nsec, timediff1.tv_nsec);

	//printf("loaded module OK.\nCheck the trace pipe to see the output : sudo cat /sys/kernel/debug/tracing/trace_pipe \n");

	close(fd);
	free(buf);
	return 0;
}
