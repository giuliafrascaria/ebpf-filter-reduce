#!/bin/bash
#test verifier complexity for 5 different prog lengths

for i in {1..5}
do
	for j in {1..50}
		do
			#echo "run " $i
			sudo su -c "echo 1 > /proc/sys/vm/drop_caches"
			sudo su -c "echo 2 > /proc/sys/vm/drop_caches"
			sudo su -c "echo 3 > /proc/sys/vm/drop_caches" 
			taskset -c 0 sudo ./verifier $i
		done
done

