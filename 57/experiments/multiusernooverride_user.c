// SPDX-License-Identifier: GPL-2.0

// https://programmingtoddler.wordpress.com/2014/11/09/c-how-to-get-system-timestamp-in-second-millisecond-and-microsecond/

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
	if (argc != 3)
	{
		printf("usage: ./multiuser nusers niters\n");
	}

	//number of iterations on file, max 25600
	int users = atoi(argv[1]);

	int iters = atoi(argv[2]);


    int ret3, ret4, ret5, ret6;
    struct timespec tp3, tp4, tp5, tp6;
    clockid_t clk_id3, clk_id4, clk_id5, clk_id6;



	char filename[256];
	int ret, err, id, fkey = MIN_FUNC;
	struct rlimit r = {RLIM_INFINITY, RLIM_INFINITY};

	snprintf(filename, sizeof(filename), "%s_kern.o", argv[0]);
	//printf("eBPF file to be loaded is : %s \n", filename);
	setrlimit(RLIMIT_MEMLOCK, &r);

	if (load_bpf_file(filename)) {
		printf("%s", bpf_log_buf);
		return 1;
	}

	// ------------------ end to end latency test for loading ---------------------------
	char extension[256];
	snprintf(extension, sizeof(extension), "%s_func.o", argv[1]);
	//printf("eBPF file to be loaded is : %s \n", extension);

	struct bpf_object *obj;

	int prog_fd;
	char extension2[256];
	snprintf(extension2, sizeof(extension2), "%s_func.o", argv[2]);
	//printf("eBPF file to be loaded is : %s \n", extension2);

	struct bpf_object *obj2;
	int prog_fd2;

    clk_id3 = CLOCK_MONOTONIC;
    clk_id4 = CLOCK_MONOTONIC;                    
    ret3 = clock_gettime(clk_id3, &tp3);

	

	// ---------------- trigger call with instrumentattion and measure performace -------------------------------
	



	// open file and read to trigger the instrumentation
	int fd = open("randnum", O_RDONLY);
	if (fd == -1)
	{
		printf("error open file\n");
		exit(EXIT_FAILURE);
	}

	int pid;
	for (int i = 0; i < users; i ++)
	{
		pid = fork();
		if (pid < 0)
		{
			printf("fork error\n");
			exit(EXIT_FAILURE);
		}
		else if(pid == 0)
		{
			//child process, load buffer address on map and trigger read
			char * buf = malloc(4096*iters);

			//printf("child %d\n", i);
			__u32 key = 0;
			//printf("buffer on user side = %lu\n", (unsigned long) buf);	
			if (bpf_map_update_elem(map_fd[0], &key, &buf, BPF_ANY) != 0) 
			{
				fprintf(stderr, "map_update failed: %s\n", strerror(errno));
				return 1;
			}

			clk_id5 = CLOCK_MONOTONIC;
			clk_id6 = CLOCK_MONOTONIC;
			ret5 = clock_gettime(clk_id5, &tp5);

			ssize_t readbytes = read(fd, buf, 4096*iters);
			
            int override;
			if(strncmp(buf, "4242", 4) == 0)
			{
				//never actually gonna happen but I need to avoid compiler optimizations
				override = 1;
				//return 1;
			}
            else
            {
                override = 0;
            }

			
			
			unsigned long min;
			bpf_map_lookup_elem(map_fd[1], &key, &min);

			ret6 = clock_gettime(clk_id6, &tp6);
			if (ret5 < 0)
			{
				printf("failed clock 1\n");
			}
			if (ret6 < 0)
			{
				printf("failed clock 1\n");
			}
			struct timespec diff3 = diff(tp5, tp6);

			printf("%d,%d,%d,%ld\n", i, iters, override, diff3.tv_nsec);
			return 0;
		}
		
	}

	for(int i=0; i<users; i++) // loop will run n times (n=5) 
    	wait(NULL); 

 	

	//printf("counted %lu\n", min);


	//printf("loaded module OK.\nCheck the trace pipe to see the output : sudo cat /sys/kernel/debug/tracing/trace_pipe \n");

	return 0;
}
