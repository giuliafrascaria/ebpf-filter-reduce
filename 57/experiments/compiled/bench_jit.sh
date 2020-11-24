#!/bin/bash

for i in {1..1000}
do
   	
		sudo su -c "echo 1 > /proc/sys/vm/drop_caches"
		sudo su -c "echo 2 > /proc/sys/vm/drop_caches"
		sudo su -c "echo 3 > /proc/sys/vm/drop_caches" 
		#sudo su -c "echo 200 > /proc/sys/vm/vfs_cache_pressure"
		taskset -c 0 sudo ./jit 1
		#sleep 1
	
done