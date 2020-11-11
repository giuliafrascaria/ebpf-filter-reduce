#!/bin/bash
#test end to end latency for different iteration numbers, to be updated

for i in {1..25600..4095}
do
	for j in {1..50}
		do
			#echo "run " $i
			sudo su -c "echo 1 > /proc/sys/vm/drop_caches"
			sudo su -c "echo 2 > /proc/sys/vm/drop_caches"
			sudo su -c "echo 3 > /proc/sys/vm/drop_caches" 
			taskset -c 0 ./native $i
			sudo su -c "echo 1 > /proc/sys/vm/drop_caches"
			sudo su -c "echo 2 > /proc/sys/vm/drop_caches"
			sudo su -c "echo 3 > /proc/sys/vm/drop_caches"
			taskset -c 0 sudo ./e2e filter25 sum25 $i
#			taskset -c 0 sudo ./endtoend filter25 sum25 $i
		done
	sleep 1
done

