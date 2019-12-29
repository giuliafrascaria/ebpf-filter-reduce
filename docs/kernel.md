    1  ls
    2  uname -r
    3  git clone https://github.com/torvalds/linux.git
    8  sudo apt install make
   10  sudo apt-get install gcc
   11  git checkout tags/v4.15
   12  sudo apt-get install libncurses-dev flex bison openssl libssl-dev dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf
   14  make menuconfig
   15  make -j 4
   16  sudo make modules_install
   17  sudo make install
   18  sudo update-initramfs -c -k 4.15.0
   19  sudo update-grub2
   20  fakeroot make-kpkg kernel_headers -4
   21  sudo apt-get install kernel-package
   25  cd /etc/default/
   27  sudo nano grub
   29  sudo update-grub2 

   44  sudo apt-get install clang
   45  sudo apt-get install llc
   46  sudo apt-get install llvm

   55  git clone https://github.com/libbpf/libbpf.git

  100  nano Makefile 
  101  make headers_install
  121  sudo mkdir /usr/src/linux-header-4.15.0
  122  cd ..
  123  mv /usr/src/linux-header-4.15.0/ /usr/src/linux-headers-4.15.0
  124  sudo mv /usr/src/linux-header-4.15.0/ /usr/src/linux-headers-4.15.0
  125  sudo cp include/ /usr/src/linux-headers-4.15.0/
  126  sudo cp -r include/ /usr/src/linux-headers-4.15.0/
  127  cd /usr/src/linux-headers-4.15.0/include/
  128  ls
  129  cd /home/giogge/linux/
  130  ls
  131  cd arch/x86/
  132  ls
  133  cd ..
  134  sudo mkdir /usr/src/linux-headers-4.15.0/arch
  135  sudo cp -r x86/ /usr/src/linux-headers-4.15.0/arch/
  136  cd ..
  137  ls
  138  cd thesis/
  139  ls
  140  cd ebpf-experiments/
  141  ls
  142  cd 415/
  143  cd src/
  144  ls
  145  ./newmake.sh 
  146  ls
  147  nano newmake.sh 
  148  ./newmake.sh 
  149  ls
  150  cd ..
  151  ls
  152  nano common/
  153  cd common/
  154  ls
  155  cd ..
  156  ls
  157  cd common/
  158  ls
  159  touch perf-sys.h
  160  nano perf-sys.h 
  161  cd ..
  162  cd src/
  163  ls
  164  ./newmake.sh 
  165  cd /
  166  ls
  167  cd usr/
  168  ls
  169  cd src/
  170  ls
  171  cd linux-headers-4.15.0
  172  ls
  173  cd arch/
  174  ls
  175  cd x86/
  176  ls
  177  cd tools/
  178  ls
  179  cd ..
  180  cd /home/giogge/linux/
  181  ls
  182  sudo rm -rf /usr/src/linux-headers-4.15.0/arch/x86/
  183  sudo mkdir /usr/src/linux-headers-4.15.0/arch/x86/include
  184  sudo mkdir /usr/src/linux-headers-4.15.0/arch/x86/include/
  185  sudo mkdir /usr/src/linux-headers-4.15.0/arch/x86
  186  sudo mkdir /usr/src/linux-headers-4.15.0/arch/x86/include
  187  sudo cp -r arch/x86/include/ /usr/src/linux-headers-4.15.0/arch/x86/include/
  188  cd /usr/src/linux-headers-4.15.0
  189  ls
  190  cd arch/
  191  ls
  192  cd x86/include/
  193  ls
  194  cd include/
  195  ls
  196  cd ..
  197  ls
  198  cd ..
  199  sudo rm -rf include/
  200  cd /home/giogge/linux/
  201  sudo cp -r arch/x86/include/ /usr/src/linux-headers-4.15.0/arch/x86/
