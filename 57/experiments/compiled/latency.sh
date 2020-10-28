#!/bin/bash


for i in {1..5}
do
	for j in {1..10}
		do
			#echo "run " $i
			sudo su -c "echo 1 > /proc/sys/vm/drop_caches"
			sudo su -c "echo 2 > /proc/sys/vm/drop_caches"
			sudo su -c "echo 3 > /proc/sys/vm/drop_caches" 
			taskset -c 0 sudo ./endtoend $i
		done
done

