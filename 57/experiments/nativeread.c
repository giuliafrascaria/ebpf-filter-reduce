#define _GNU_SOURCE
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <sched.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <locale.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <time.h>
#include <sys/resource.h>
#include <sys/wait.h>
#include <assert.h>


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
	if (argc != 2)
	{
		printf("usage: ./native iterations\n");
	}

	//number of iterations on file, max 25600
	int iters = atoi(argv[1]);


    int ret1, ret2;
    struct timespec tp1, tp2;
    clockid_t clk_id1, clk_id2;

    clk_id1 = CLOCK_MONOTONIC;
    clk_id2 = CLOCK_MONOTONIC;


    // open file and read to trigger the instrumentation
	int fd1 = open("rand2", O_RDONLY);
	if (fd1 == -1)
	{
		printf("error open file\n");
		exit(EXIT_FAILURE);
	}

 	char * buf1 = malloc(4096*iters);

	/*
	timing for the native execution without the ebpf extension
	*/

    ret1 = clock_gettime(clk_id1, &tp1);

    ssize_t readbytes1 = read(fd1, buf1, 4096*iters);
    for(int j = 0; j < readbytes1; j += 4)
    {
        if(strncmp(buf1+j, "4242", 4) == 0)
        {
            //never actually gonna happen but I need to avoid compiler optimizations
            printf("found\n");
            return 1;
        }
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
	struct timespec diff1 = diff(tp1, tp2);

    printf("%d,1,%ld\n", iters, diff1.tv_nsec);
    
    close(fd1);

    return 1;

}