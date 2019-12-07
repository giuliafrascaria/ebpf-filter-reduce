#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>




int main(void)
{
	//while(1)
	//{
		int fd = open("f", O_RDONLY);
		if (fd == -1)
		{
			printf("error open file\n");
			exit(EXIT_FAILURE);
		}

		char * buf = malloc(10);
		ssize_t readbytes = read(fd, buf, 1);
		close(fd);

		printf("%s\n", buf);
		free(buf);

	//}


	exit(EXIT_SUCCESS);
}
