#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <linux/bpf.h>
#include "libbpf.h"
#include "bpf_load.h"
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <linux/unistd.h>


static void verify_map(int map_id)
{
	__u32 key = 0;
	__u32 val;

	if (bpf_map_lookup_elem(map_id, &key, &val) != 0) {
		fprintf(stderr, "map_lookup failed: %s\n", strerror(errno));
		return;
	}
	if (val == 0) {
		fprintf(stderr, "failed: map #%d returns value 0\n", map_id);
		return;
	}
	val = 0;
	if (bpf_map_update_elem(map_id, &key, &val, BPF_ANY) != 0) {
		fprintf(stderr, "map_update failed: %s\n", strerror(errno));
		return;
	}
}

int main(int argc, char **argv)
{
	int map_fd;
	struct bpf_object *obj;
	
	if (argc != 2)
	{
		printf("Usage: ./attach_open <filename> \n");
		return 1;
	}

	char filename[256];
        snprintf(filename, sizeof(filename), "%s_kern.o", argv[0]);

	if (load_bpf_file(argv[0])) {
                printf("%s", bpf_log_buf);
                return 1;
        }

	map_fd = bpf_object__find_map_fd_by_name(obj, "my_map");

	__u32 key = 0;
	//void * value = argv[1];
	int val = open(argv[1], O_RDONLY);
	{
                fprintf(stderr, "open failed: %s\n", strerror(errno));
                return 1;
        }

	if (bpf_map_update_elem(map_fd, &key, &val, BPF_ANY) != 0) {
                  fprintf(stderr, "map_update failed: %s\n", strerror(errno));
                  return;
        }

	return 0;
	//attach_fd = open(argv[1], O_RDONLY);
	//if(attach_fd < 0)
	//{
	//	fprintf(stderr, "open failed: %s\n", strerror(errno));
	//	return 1;
	//}

	//read from bpf map to see if the filename is there??
	//option 2 is actually writing the filename in the map BEFORE the open and then having the kernel side look for it
	//yes will do this actually :D	


	// this will not work, I need to have a specific bpf program type to attach to a filename
	// BPF_ATTACH_FILE_OPS
	//error = bpf_prog_attach(prog_fd[0], attach_fd, BPF_CGROUP_SOCK_OPS, 0);
        //if (error) {
        //        printf("ERROR: bpf_prog_attach: %d (%s)\n",
        //               error, strerror(errno));
        //        return 5;
        //}
	return 0;
}
