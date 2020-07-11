#!/bin/bash


for i in {1..100}
do
   	for j in {1..3}
	do
		sudo su -c "echo 1 > /proc/sys/vm/drop_caches"
		sudo su -c "echo 2 > /proc/sys/vm/drop_caches"
		sudo su -c "echo 3 > /proc/sys/vm/drop_caches" 
		sudo su -c "echo 200 > /proc/sys/vm/vfs_cache_pressure"
		sleep 1
		sudo ./override_exec $i
		#sleep 1
	done
done
