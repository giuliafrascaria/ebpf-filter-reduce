# eBPF filter-reduce

welcome! this is the repository for the eBPF filter-reduce prototype. This project was carried out as a M.Sc. thesis project for Computer Science in Vrije Universiteit of Amsterdam. 

## what is this?
eBPF filter-reduce explores the potential for eBPF, an in-kernel technology that is widely used in other fields, to perform data processing functionalities.
Processing data in-kernel can have the advantage to reduce latency and make computation more efficient, so this may be a worthwhile challenge!

## try it out
This Appendix gives guidelines to install a setup for the eBPF Filter-Reduce prototype that was presented in the thesis.
The project used an ubuntu 18.4 server virtual machine with kvm ( \url{https://releases.ubuntu.com/18.04/} ) equipped with 120GB HDD and 16GB of RAM. The thesis project and Linux kernel have the following dependencies:

```
gcc 
clang 
llc 
llvm 
libncurses-dev 
flex 
bison 
openssl 
libssl-dev 
dkms 
libelf-dev 
libudev-dev 
libpci-dev 
libiberty-dev 
autoconf
```

The source code for the prototype and the Linux kernel version that is needed to run it can be retrieved with 

```
git clone --branch stable5.7 https://github.com/giuliafrascaria/linux.git
git clone --branch 5.7 https://github.com/giuliafrascaria/ebpf-filter-reduce.git
git clone https://github.com/libbpf/libbpf
```

The source code needs to be built for all the components. Libbpf needs to be built and copied in the ebpf-filter-reduce repository (copy /libbpf/src/ in /ebpf-experiments/57/libbpf/src/)

In order to build the Linux kernel, you can checkout this tag and compile with the config file in the repository, so that the necessary BPF flags are set for correct execution. In the Linux repository:

```
git checkout tags/testsetup-kern -b test

make oldconfig
make
sudo make modules_install
sudo make install
```

At this point it is possible to reboot and create the necessary global and local headers from the Linux directory

```
make headers_install

sudo mkdir /usr/src/linux-headers-`uname -r`
sudo mkdir /usr/src/linux-headers-`uname -r`/arch
sudo mkdir /usr/src/linux-headers-`uname -r`/arch/x86

sudo cp -r include/ /usr/src/linux-headers-`uname -r`/
sudo cp -r arch/x86/include/ /usr/src/linux-headers-`uname -r`/arch/x86/
```

At this point all the necessary headers should be present to execute the code in the folder /ebpf-filter-reduce/57, where extensions can be compiled with the script ```make.sh```.


# blog posts
The project took a decent amount of time to complete and 
you can find notes for the project [HERE](https://giuliafrascaria.github.io/ebpf-experiments/)
