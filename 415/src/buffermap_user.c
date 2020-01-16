// this bpf code passes the file descriptor of a file from userspace to kernel bpf instrumentation through a map

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <linux/bpf.h>
//#include "libbpf.h"
#include "bpf_load.h"
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <linux/unistd.h>


int main(int argc, char **argv)
{
	//int map_fd;
	struct bpf_object *obj;
	printf("welcome\n");
	if (argc != 2)
	{
		printf("Usage: ./buffermap <filename> \n");
		return 1;
	}

	char filename[256];
        snprintf(filename, sizeof(filename), "%s_kern.o", argv[0]);
	
	printf("loading bpf extension %s\n", filename);
	if (load_bpf_file(filename)) 
	{	
		fprintf(stderr, "ERROR: loading BPF program (errno %d):\n", errno);
                
		if (strcmp(bpf_log_buf, "") == 0)
			fprintf(stderr, "no info from the error buffer\n");
		else
			fprintf(stderr, "%s", bpf_log_buf);
		
                return 1;
        }
	printf("loaded bpf kernel module\n");
	// this map exists because I loaded the bpf kern module, that has a map called my_map defined in it
	//map_fd = bpf_object__find_map_fd_by_name(obj, "my_map");

	__u32 key = 0;
	int val = open(argv[1], O_RDONLY);
	if (val == -1)
	{
                fprintf(stderr, "open failed: %s\n", strerror(errno));
                return 1;
        }

	printf("file descriptor user: %d\n", val);


	// allocate a buffer for the read and pass the address to the bpf map
	char * buf = malloc(10*sizeof(char));

	printf("buffer on user side = %lu\n", (unsigned long) buf);	
	if (bpf_map_update_elem(map_fd[0], &key, &buf, BPF_ANY) != 0) 
	{
            fprintf(stderr, "map_update failed: %s\n", strerror(errno));
      		return 1;
    }
	
	ssize_t readbytes = read(val, buf, 1);
	//printf("buffer on user side = %p, file value %x\n", buf, *buf);	
	//int map_fd1 = bpf_object__find_map_fd_by_name(obj, "my_read_map");

	__u32 charkey = 0;

	//char * buffaddr;
	char charval;

	//bpf_map_lookup_elem(map_fd[1], &key, &buffaddr);
	//bpf_map_lookup_elem(map_fd[2], &charkey, &charval);

	//printf("read map value %x in buffer %x\n", charval, buffaddr);
	//printf("read map value %x\n", charval);
	// ath this point the map should be populated with the 

	return 0;
}
