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
#include <time.h>
#include <locale.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <sys/resource.h>
#include <sys/wait.h>






int main(int argc, char **argv)
{
	char filename[256];
	int ret;



	int fd = open("f", O_RDONLY);
	if (fd == -1)
	{
		printf("error open file\n");
		exit(EXIT_FAILURE);
	}

 	char * buf = malloc(4096);

    clock_t start, end;

    start = clock(); 

	ssize_t readbytes = read(fd, buf, 4096);
	//printf("retval = %d\n", (int) readbytes);


    unsigned long sum = 0;
    char curr[3];
    unsigned long num = 0; // need initialization or verifier complains on strtol
    int base = 10;
    unsigned long elems = 0;

    for (int i = 0; i < readbytes - 3; i = i+3)
    {
        //read next number in the buffer
        memcpy(curr, buf + i, 3);
        
        
        if (curr != NULL)
        {
            num = strtoul(curr, NULL, base);
            if (num < 0)
            {
                return 1;
            }
            elems = elems + 1;
        }

        sum = sum + num;
    }

    unsigned long avg = sum/elems;

    end = clock(); 


    double time_taken = (double) end - start;

	printf("avg = %lu, clock cycles %f\n", avg, time_taken);



	close(fd);
	free(buf);
	return 0;
}
