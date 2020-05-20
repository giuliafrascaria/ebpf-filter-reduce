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


 	char * buf = malloc(10);

	__u32 key = 0;	
	if (bpf_map_update_elem(map_fd[0], &key, &buf, BPF_ANY) != 0) 
	{
		fprintf(stderr, "map_update failed: %s\n", strerror(errno));
		return 1;
    }

    char * expected = "42";

    int override_count = 0;
    int exec_count = 0;

    for (int i = 0; i < 100; i++)
    {

        int fd = open("f", O_RDONLY);
        if (fd == -1)
        {
            printf("error open file\n");
            exit(EXIT_FAILURE);
        }

        ssize_t readbytes = read(fd, buf, 2);

        if ( strcmp(buf, expected) == 0)
        {
            override_count = override_count + 1;
        }
        else
        {
            exec_count = exec_count + 1;
        }

        close(fd);
        memset(buf, 0, 10);

    }

	printf("execution override success: %d\nExecution override failed: %d\n", override_count, exec_count);

	free(buf);
	return 0;
}
