#include <stdio.h>
#include <linux/version.h>

int
main(int argc, char *argv[])
{
	printf("%d", LINUX_VERSION_CODE);
	return 0;
}