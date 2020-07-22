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
#include <fcntl.h>
#include <sys/mman.h>
#include <malloc.h>

#define ITERATIONS 1
#define MAX_ITER 10000
#define ALIGN 4096
#define READ_SIZE 512 //file is now 32*4kb = 131072 262144 1mb=1048576 4mb= 4194304 2mb=2097152
#define MAX_READ 4096
#define EXEC_1 0
#define EXEC_2 1


int main(int argc, char **argv)
{
	char filename[256];
	int ret;

	snprintf(filename, sizeof(filename), "%s_kern.o", argv[0]);
	//printf("eBPF file to be loaded is : %s \n", filename);

	if (load_bpf_file(filename)) {
		printf("%s", bpf_log_buf);
		return 1;
	}

    char * expected = "42";

    char * flag = "deadbeef";

    int override_count = 0;
    int partial_override_count = 0;
    int exec_count = 0;

    if (argc != 2)
    {
        printf("usage: ./odirect n\nn: number of batched of iteration. every batch is 1000\n");
        return 1;
    }

    int i;
    i = atoi(argv[1]);

    int readsize = READ_SIZE;
    int iter = ITERATIONS * i;

    __u32 key = 0;
    __u64 counter = 0;

    if (bpf_map_update_elem(map_fd[1], &key, &counter, BPF_ANY) != 0) 
    {
        fprintf(stderr, "map_update failed: %s\n", strerror(errno));
        return 1;
    }

    if(EXEC_2)
    {

            //char * buf = mmap(NULL, 8192, PROT_READ | PROT_WRITE, MAP_ANONYMOUS, -1, 0);
            char * buf = memalign(ALIGN, ALIGN);
            if (buf == NULL)
            {
                printf("mmap error\n");
                return -1;
            }

            __u32 key = 0;	
            if (bpf_map_update_elem(map_fd[0], &key, &buf, BPF_ANY) != 0) 
            {
                fprintf(stderr, "map_update failed: %s\n", strerror(errno));
                return 1;
            }

            int fd = open("file", O_RDONLY | O_DIRECT);

            if (fd == -1)
            {
                printf("error open file 2\n");
                exit(EXIT_FAILURE);
            }

            for (int i = 0; i < iter; i++)
            {

                //memset(buf, 0, readsize);
                printf("reading\n");
                ssize_t readbytes = read(fd, buf, readsize);
                printf("%s\n", buf);
                if (readbytes == -1)
                {
                    printf("read error\n");
                }

                if ( strncmp(buf, expected, 2) == 0)
                {
                    override_count = override_count + 1;
                }
                else
                {
                    exec_count = exec_count + 1;
                }
            
                //memset(buf, 0, readsize + 1);
                
            }

            close(fd);
            //printf("---------------------------------------------------------\nknown size : %d\nsuccess: %d\npartial: %d\nfail: %d\n---------------------------------------------------------\n", readsize, override_count, partial_override_count, exec_count);
            printf("%d, %d, %d, %d\n", iter, override_count, exec_count, iter*readsize);

            override_count = 0;
            partial_override_count = 0;
            exec_count = 0;

            free(buf);

    }

    unsigned long count;
	bpf_map_lookup_elem(map_fd[1], &key, &count);

	return 0;


}
