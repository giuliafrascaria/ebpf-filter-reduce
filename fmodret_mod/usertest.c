#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char **argv)
{
	char buf[5000];

	int fd = open("/proc/helloworld", O_RDONLY);
	if(fd == -1)
	{
		printf("failed to open file\n");
		return -1;
	}

	ssize_t readbytes = read(fd, buf, 4096);
	//puts(buf);

	printf("read size %ld\n", readbytes);
}	
