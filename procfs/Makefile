obj-m += procfs_read.o
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
test:
	sudo dmesg -C
	sudo insmod procfs_read.ko
	sudo rmmod procfs_read.ko
	dmesg