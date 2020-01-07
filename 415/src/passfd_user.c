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
		printf("Usage: ./passfd <filename> \n");
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

	if (bpf_map_update_elem(map_fd[0], &key, &val, BPF_ANY) != 0) 
	{
                  fprintf(stderr, "map_update failed: %s\n", strerror(errno));
      		  return 1;
        }

	// now read from file, the bpf code on kernel side is instrumented to put a 1 in a bpf map if the instrumentation was on the passed file descriptor
	char * buf = malloc(10);
	ssize_t readbytes = read(val, buf, 1);
	
	//int map_fd1 = bpf_object__find_map_fd_by_name(obj, "my_read_map");


	unsigned long value1;
	bpf_map_lookup_elem(map_fd[1], &key, &value1);


	printf("file descriptor map: %lu\n", value1);
	// ath this point the map should be populated with the 

	return 0;
}
