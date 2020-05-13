#!/bin/sh
echo "deleting old build"
sudo rm -rf /usr/src/linux-headers-`uname -r`/
echo "OK"

echo "generating headers"
cd /home/giogge/linux 
make headers_install
echo "OK"

echo "creating new include headers folder"
sudo mkdir /usr/src/linux-headers-`uname -r`
sudo cp -r /home/giogge/linux/include/ /usr/src/linux-headers-`uname -r`/
echo "OK"

echo "creating new arch headers folder"
sudo mkdir /usr/src/linux-headers-`uname -r`/arch
sudo mkdir /usr/src/linux-headers-`uname -r`/arch/x86
sudo mkdir /usr/src/linux-headers-`uname -r`/arch/x86/include
sudo cp -r /home/giogge/linux/arch/x86/include/ /usr/src/linux-headers-`uname -r`/arch/x86/include/
echo "OK"

echo "creating own copy of hdr"
rm -rf /home/giogge/thesis/ebpf-experiments/57/usr/include/
mkdir /home/giogge/thesis/ebpf-experiments/57/usr/include
cp -r /home/giogge/linux/usr/include/ /home/giogge/thesis/ebpf-experiments/57/usr/include
echo "OK"

echo "creating own copy of tools folder"
rm -rf /home/giogge/thesis/ebpf-experiments/57/tools/
cp -r /home/giogge/linux/tools/ /home/giogge/thesis/ebpf-experiments/57/
echo "OK"

echo "copying bpf fundamentals"
cp /home/giogge/thesis/ebpf-experiments/fundamentals/* /home/giogge/thesis/ebpf-experiments/57/
echo "OK"

