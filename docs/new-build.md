## How to setup new thesis VM

I figured it's about time that I explain step by step the process to configure my thesis setup

## linux kernel

- clone my fork of linux
- checkout kernel5
- install essentials

```
sudo apt-get install build-essential linux-source bc kmod cpio flex cpio libncurses5-dev bison libssl-dev
```
- make localmodconfig or make menuconfig
- make
- sudo make modules_install
- sudo make install
- change grub file to always stop at advanced boot menu as a panic failsafe, in /etc/default/grub file

```
GRUB_DEFAULT=0
#GRUB_TIMEOUT_STYLE=hidden
GRUB_TIMEOUT=-1
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="maybe-ubiquity"
GRUB_CMDLINE_LINUX=""
GRUB_SAVEDEFAULT=true
GRUB_DEFAULT=saved
```
- reboot should boot successfully to 5.4.0+

## bpf setup 

- clone my repo
- clone libbpf
- install llvm clang libelf-dev
- local kernel headers should be just fine if the kernel version stays 5.4.0+