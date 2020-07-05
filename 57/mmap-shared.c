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
#include <sys/mman.h>




int main(int argc, char **argv)
{
	char filename[256];
	int ret;

	int fd = open("file", O_RDONLY);
	if (fd == -1)
	{
		printf("error open file\n");
		exit(EXIT_FAILURE);
	}

 	char * buf = mmap(NULL, 4096, PROT_READ, MAP_SHARED | MAP_POPULATE, fd, 0);
     if (buf == NULL)
    {
        fprintf(stderr, "mmap failed: %s\n", strerror(errno));
		return 1;
    }


	close(fd);


    while(1)
    {
        printf("looping %c\n", *buf);
        sleep(2);
    }

	return 0;
}
