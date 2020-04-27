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


#define ITERATIONS 10000
#define READ_SIZE 4095
#define MAX_READ 4096
#define EXEC_1 0
#define EXEC_2 2


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

    int readsize = READ_SIZE;


    __u32 key = 0;
    __u64 counter = 0;

    if (bpf_map_update_elem(map_fd[1], &key, &counter, BPF_ANY) != 0) 
    {
        fprintf(stderr, "map_update failed: %s\n", strerror(errno));
        return 1;
    }


    if(EXEC_1)
    {
        while (readsize <= MAX_READ)
        {
            char * buf = malloc(readsize + 1);

            printf("buffer on user side = %lu\n", (unsigned long) buf);

            __u32 key = 0;	
            if (bpf_map_update_elem(map_fd[0], &key, &buf, BPF_ANY) != 0) 
            {
                fprintf(stderr, "map_update failed: %s\n", strerror(errno));
                return 1;
            }


            for (int i = 0; i < ITERATIONS; i++)
            {

                char * rand = malloc(readsize + 1);
                
                int src = open("/dev/urandom", O_RDONLY);
                ssize_t randbytes = read(src, rand, readsize);
                close(src);

                int fd = open("file", O_WRONLY | O_TRUNC);

                if (fd == -1)
                {
                    printf("error open file\n");
                    exit(EXIT_FAILURE);
                }

                int bytes = write(fd, flag, sizeof(flag));
                if (bytes == -1)
                {
                    printf("error write file\n");
                    exit(EXIT_FAILURE);
                }

                bytes = write(fd, rand, readsize );
                if (bytes == -1)
                {
                    printf("error write file\n");
                    exit(EXIT_FAILURE);
                }

                free(rand);

                //fsync(fd);
                close(fd); 

                //int fd = open("4kB", O_RDONLY);
                fd = open("file", O_RDONLY);

                if (fd == -1)
                {
                    printf("error open file 2\n");
                    exit(EXIT_FAILURE);
                }

                ssize_t readbytes = read(fd, buf, readsize);

                if ( strncmp(buf, "42", 2) == 0)
                {
                    override_count = override_count + 1;
                }
                else
                {
                    exec_count = exec_count + 1;
                }
                
                close(fd);
                memset(buf, 0, readsize + 1);
                
            }

            printf("---------------------------------------------------------\nrand size : %d\nsuccess: %d\nfailed: %d\n---------------------------------------------------------\n", readsize, override_count, exec_count);
            override_count = 0;
            exec_count = 0;

            readsize = readsize * 2;

            free(buf);

        }
    }
    


    override_count = 0;
    partial_override_count = 0;
    exec_count = 0;

    readsize = READ_SIZE;

    if(EXEC_2)
    {
        while (readsize <= MAX_READ)
        {
            char * buf = malloc(readsize + 1);
            //char * buf = mmap(NULL, 4095, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

            printf("buffer on user side = %lu\n", (unsigned long) buf);

            __u32 key = 0;	
            if (bpf_map_update_elem(map_fd[0], &key, &buf, BPF_ANY) != 0) 
            {
                fprintf(stderr, "map_update failed: %s\n", strerror(errno));
                return 1;
            }


            for (int i = 0; i < ITERATIONS; i++)
            {

                int fd = open("f", O_RDONLY);

                if (fd == -1)
                {
                    printf("error open file 2\n");
                    exit(EXIT_FAILURE);
                }

                /*char *i_num = malloc(10);
                sprintf(i_num, "%d", i);
                
                printf("%s\n", i_num);
                if (bpf_map_update_elem(map_fd[2], &key, &i_num, BPF_ANY) != 0) 
                {
                    fprintf(stderr, "map_update failed: %s\n", strerror(errno));
                    return 1;
                }*/

                memset(buf, 0, readsize + 1);
                ssize_t readbytes = read(fd, buf, readsize);

                if ( strncmp(buf, expected, 2) == 0)
                {
                    if(strcmp(buf + 2, "A") == 0)
                    {
                        partial_override_count += 1;
                    }
                    else
                    {
                        override_count = override_count + 1;
                    }
                    //printf("read %s\n", buf);
                }
                else
                {
                    exec_count = exec_count + 1;
                    //printf("read %s\n", buf);
                }
                
                close(fd);
                memset(buf, 0, readsize + 1);
                
            }

            printf("---------------------------------------------------------\nknown size : %d\nsuccess: %d\npartial: %d\nfail: %d\n---------------------------------------------------------\n", readsize, override_count, partial_override_count, exec_count);
            override_count = 0;
            partial_override_count = 0;
            exec_count = 0;

            readsize = readsize * 2;

            free(buf);

        }
    }

    

	//printf("execution override success: %d\nExecution override failed: %d\n", override_count, exec_count);

    unsigned long count;
	bpf_map_lookup_elem(map_fd[1], &key, &count);

    printf("kprobe executed %lu times\n", count);

	return 0;


}
