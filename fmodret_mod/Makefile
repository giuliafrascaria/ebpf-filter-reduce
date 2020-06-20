obj-m += fmodret_test.o
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
test:
	sudo dmesg -C
	sudo insmod fmodret_test.ko
	sudo rmmod fmodret_test.ko
	dmesg