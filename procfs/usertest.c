#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

void main(void)
{
	char buf[5000];

	//int src = open("file", O_RDONLY);

	//read(src, buf, sizeof(buf));

	int fd = open("/proc/helloworld", O_RDWR);
	//read(fd, buf, 100);
	//puts(buf);

	//lseek(fd, 0 , SEEK_SET);
	//write(fd, buf, sizeof(buf));
	
	//lseek(fd, 0 , SEEK_SET);
	ssize_t readbytes = read(fd, buf, 4096);
	puts(buf);

	printf("read size %ld\n", readbytes);
}	
