#!/bin/sh
echo deleting old build
sudo rm -rf /usr/src/linux-headers-`uname -r`/

echo generating headers
cd /home/giogge/linux 
make headers_install

echo creating new include headers folder
sudo mkdir /usr/src/linux-headers-`uname -r`
sudo cp -r /home/giogge/linux/include/ /usr/src/linux-headers-`uname -r`/

echo creating new arch headers folder
sudo mkdir /usr/src/linux-headers-`uname -r`/arch
sudo mkdir /usr/src/linux-headers-`uname -r`/arch/x86
sudo mkdir /usr/src/linux-headers-`uname -r`/arch/x86/include
sudo cp -r /home/giogge/linux/arch/x86/include/ /usr/src/linux-headers-`uname -r`/arch/x86/include/

echo creating own copy of hdr
rm -rf /home/giogge/thesis/ebpf-experiments/57/usr/
mkdir /home/giogge/thesis/ebpf-experiments/57/usr/
cp -r /home/giogge/linux/include/ /home/giogge/thesis/ebpf-experiments/57/usr/

echo creating own copy of tools
