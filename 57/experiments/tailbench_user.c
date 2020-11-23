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
    // bemchmark of verification and execution complexity with double tail call
	if (argc != 4)
	{
		printf("usage: ./tailbench filter-function reduce-function iter\n");
	}

	int i;
    i = atoi(argv[3]);

    int ret1, ret2, ret3, ret4, ret5, ret6, ret7, ret8;
    struct timespec tp1, tp2, tp3, tp4, tp5, tp6, tp7, tp8;
    clockid_t clk_id1, clk_id2, clk_id3, clk_id4, clk_id5, clk_id6;

    clk_id1 = CLOCK_MONOTONIC;
    clk_id2 = CLOCK_MONOTONIC;

	char filename[256];
	int ret, err, id, fkey = MIN_FUNC;
	struct rlimit r = {RLIM_INFINITY, RLIM_INFINITY};

	snprintf(filename, sizeof(filename), "%s_kern.o", argv[0]);
	//printf("eBPF file to be loaded is : %s \n", filename);
	setrlimit(RLIMIT_MEMLOCK, &r);

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
	struct timespec timediff1 = diff(tp1, tp2);
    //printf("1,%ld\n",  diff1);

	// ------------------ filter ---------------------------
	char extension[256];
	snprintf(extension, sizeof(extension), "%s_func.o", argv[1]);
	//printf("eBPF file to be loaded is : %s \n", extension);

	struct bpf_object *obj;

    clk_id3 = CLOCK_MONOTONIC;
    clk_id4 = CLOCK_MONOTONIC;                    
    ret3 = clock_gettime(clk_id1, &tp3);

	int prog_fd;
	if (bpf_prog_load(extension, BPF_PROG_TYPE_KPROBE, &obj, &prog_fd))
	{
		printf("error reading extension");
		return 1;
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
	struct timespec timediff2 = diff(tp3, tp4);
    //printf("load 2 %ld,%ld,%ld\n", tp3.tv_nsec, tp4.tv_nsec, diff2);

	// ---------------- reduce -------------------------------
	char extension2[256];
	snprintf(extension2, sizeof(extension2), "%s_func.o", argv[2]);
	//printf("eBPF file to be loaded is : %s \n", extension2);

	struct bpf_object *obj2;

	int prog_fd2;

    clk_id5 = CLOCK_MONOTONIC;
    clk_id6 = CLOCK_MONOTONIC;
    ret5 = clock_gettime(clk_id1, &tp5);

	if (bpf_prog_load(extension2, BPF_PROG_TYPE_KPROBE, &obj2, &prog_fd2))
	{
		printf("error reading extension");
		return 1;
	}

    ret6 = clock_gettime(clk_id1, &tp6);
	if (ret5 < 0)
	{
		printf("failed clock 5\n");
	}
	if (ret6 < 0)
	{
		printf("failed clock 6\n");
	}
	struct timespec timediff3 = diff(tp5, tp6);

	// load filter function prog fd in main kprobe intrumentation
	err = bpf_map_update_elem(map_fd[2], &fkey, &prog_fd, BPF_ANY);
	if(err)
	{
		printf("map update error for prog\n");
		return 1;
	}

	//load reduce function progfd in filter instrumentation
	int filter_map_fd = bpf_object__find_map_fd_by_name(obj, "jmp_table");
	err = bpf_map_update_elem(filter_map_fd, &fkey, &prog_fd2, BPF_ANY);
	if(err)
	{
		printf("map update error for filter prog\n");
		return 1;
	}

	// open file and read to trigger the instrumentation
	int fd = open("randnum", O_RDONLY);
	if (fd == -1)
	{
		printf("error open file\n");
		exit(EXIT_FAILURE);
	}

 	char * buf = malloc(4096*i);

	__u32 key = 0;
	//printf("buffer on user side = %lu\n", (unsigned long) buf);	
	if (bpf_map_update_elem(map_fd[0], &key, &buf, BPF_ANY) != 0) 
	{
		fprintf(stderr, "map_update failed: %s\n", strerror(errno));
		return 1;
    }

	ret7 = clock_gettime(clk_id1, &tp7);
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

	//int result_map_fd = bpf_object__find_map_fd_by_name(obj2, "result_map");
	//unsigned long elems;
	//bpf_map_lookup_elem(result_map_fd, &key, &elems);
	//printf("counted %lu\n", elems);
	
	ret8 = clock_gettime(clk_id1, &tp8);
	if (ret7 < 0)
	{
		printf("failed clock 7\n");
	}
	if (ret8 < 0)
	{
		printf("failed clock 8\n");
	}

	struct timespec timediff4 = diff(tp7, tp8);
    printf("%lu,%lu,%lu,%lu\n", timediff1.tv_nsec, timediff2.tv_nsec, timediff3.tv_nsec, timediff4.tv_nsec);



	//printf("loaded module OK.\nCheck the trace pipe to see the output : sudo cat /sys/kernel/debug/tracing/trace_pipe \n");

	close(fd);
	free(buf);
	return 0;
}
// SPDX-License-Identifier: GPL-2.0

