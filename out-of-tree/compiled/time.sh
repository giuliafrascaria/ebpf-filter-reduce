#!/bin/bash

echo "userspace processing"

for value in {1..50}
do
	./a.out
	sleep 1s
done

echo "bpf processing"

for value in {1..50}
do
        sudo ./bpfbench
	sleep 1s
done

