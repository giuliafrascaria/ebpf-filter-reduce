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
	if (argc != 3)
	{
		printf("usage: ./progarray filter-function reduce-function\n");
	}

    int ret1, ret2, ret3, ret4, ret5, ret6;
    struct timespec tp1, tp2, tp3, tp4, tp5, tp6;
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
    
    ret2 = clock_gettime(clk_id2, &tp2);
	if (ret1 < 0)
	{
		printf("failed clock 1\n");
	}
	if (ret2 < 0)
	{
		printf("failed clock 2\n");
	}
	long diff1 = tp2.tv_nsec- tp1.tv_nsec;
    printf("load 1 %ld,%ld,%ld\n", tp1.tv_nsec, tp2.tv_nsec, diff1);

	// ------------------ filter ---------------------------
	char extension[256];
	snprintf(extension, sizeof(extension), "%s_func.o", argv[1]);
	//printf("eBPF file to be loaded is : %s \n", extension);

	struct bpf_object *obj;

    clk_id3 = CLOCK_MONOTONIC;
    clk_id4 = CLOCK_MONOTONIC;                    
    ret3 = clock_gettime(clk_id3, &tp3);

	int prog_fd;
	if (bpf_prog_load(extension, BPF_PROG_TYPE_KPROBE, &obj, &prog_fd))
	{
		printf("error reading extension");
		return 1;
	}

    ret4 = clock_gettime(clk_id4, &tp4);
	if (ret3 < 0)
	{
		printf("failed clock 1\n");
	}
	if (ret4 < 0)
	{
		printf("failed clock 1\n");
	}
	long diff2 = tp4.tv_nsec- tp3.tv_nsec;
    printf("load 2 %ld,%ld,%ld\n", tp3.tv_nsec, tp4.tv_nsec, diff2);

	// ---------------- reduce -------------------------------
	char extension2[256];
	snprintf(extension2, sizeof(extension2), "%s_func.o", argv[2]);
	//printf("eBPF file to be loaded is : %s \n", extension2);

	struct bpf_object *obj2;

	int prog_fd2;

    clk_id5 = CLOCK_MONOTONIC;
    clk_id6 = CLOCK_MONOTONIC;
    ret5 = clock_gettime(clk_id5, &tp5);

	if (bpf_prog_load(extension2, BPF_PROG_TYPE_KPROBE, &obj2, &prog_fd2))
	{
		printf("error reading extension");
		return 1;
	}

    ret6 = clock_gettime(clk_id6, &tp6);
	if (ret5 < 0)
	{
		printf("failed clock 1\n");
	}
	if (ret6 < 0)
	{
		printf("failed clock 1\n");
	}
	long diff3 = tp6.tv_nsec- tp5.tv_nsec;
    printf("load 3 %ld,%ld,%ld\n", tp5.tv_nsec, tp6.tv_nsec, diff3);

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
	int fd = open("f", O_RDONLY);
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

	ssize_t readbytes = read(fd, buf, 4096);
	//printf("retval = %d\n", (int) readbytes);



	//printf("loaded module OK.\nCheck the trace pipe to see the output : sudo cat /sys/kernel/debug/tracing/trace_pipe \n");

	close(fd);
	free(buf);
	return 0;
}
// SPDX-License-Identifier: GPL-2.0

