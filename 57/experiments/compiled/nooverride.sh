#!/bin/bash

#for i in {1000..50000..4000}
for i in {1..21000..2000}
do

    for j in range{1..100}
    do
        sudo su -c "echo 1 > /proc/sys/vm/drop_caches"
        sudo su -c "echo 2 > /proc/sys/vm/drop_caches"
        sudo su -c "echo 3 > /proc/sys/vm/drop_caches" 
        #sudo su -c "echo 200 > /proc/sys/vm/vfs_cache_pressure"
        #taskset -c 0 sudo ./multiusernooverride 1 $i
        sudo ./multiusernooverride 8 $i
        #sleep 1
    done

done