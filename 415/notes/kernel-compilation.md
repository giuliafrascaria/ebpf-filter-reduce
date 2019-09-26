# kernel headaches 101

## 5.2 - 5.3

In order to run ebpf examples from the kernel source tree, I needed to have access to kernel headers and linux source code. For this reason, I needed to install a compiled kernel from source. My first choice was to go with the latest kernel, 5.3, since it provides bounded loop support for ebpf and that's a nice-to-have feature for storage functions.

Since 5.3 was still in r.c. phase, I started to compile 5.2 kernel in the meantime. Unfortunately, we found out the hard way that the 5.2 kernel only compiles with the ASM_GOTO flag, and this breaks the clang support for the kernel, thus making it impossible to compile bpf examples even from the kernel source tree ( https://github.com/iovisor/bcc/issues/2119 ). In the wait for a fix to this, we downgraded to 4.15. (note: at this point there is technically a patch in the llvm line, but we decided to not waste time with that at the moment and try to get up to speed with ebpf understanding in the meantime)

## 4.15

I tried to install linux kernel 4.15 on my ubuntu bionic server. I arbitrarily chose 4.15.9 and found out the hard way that tracex1 example will not compile anyway, due to a clash in header file paths that would lead to include the wrong processor-flag.h file and fail the compilation process (more on that in samples_comments, fun stuff)

Since 4.15.0 seems to work, I checked out that version from the linux kernel tree and compiled it. Unfortunately, the grub file automatically picks the most recent kernel version and will not boot to 4.15.0 even if I manually set that option in /etc/default/grub .

My only option was to access advanced boot mode on startup, but there is no such interface by default in the ubuntu-server environment. After trying many timeout tweaks (FIRST BACKUP THE ORIGINAL GRUB!), I found out that setting the grub timeout to -1 boots by default in the menu that allows to choose the kernel. This is the /etc/default/grub file that made it

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

After booting in 4.15.0, I deleted the vmlinuz image of the 4.15.0.64 that was installed by default in the vm, and reset the original grub file to avoid always stopping in the advanced boot menu.

### the end (for now...)

Nope

### updates

As it turned out, the problem persisted and in 4.15.0 I still had the asm directory in the headers. Instead of building the headers with fakeroot, I manually copied the folders to the /usr/src/4.15.0 headers directory to get the compilation working.
I still have a /asm/linkage.h missing dependency which should be in the asm directory that was giving me problems in the previous steps.
However, good news is that it is finally possible to compile bpf samples from the kernel sources. I will check their header dependencies to fix my local build.

make headers_install in the linux git directory created these local headers in /usr/include/ (local to the repository, not in the kernel source path)

```
make headers_install
  CHK     include/generated/uapi/linux/version.h
  HOSTCC  scripts/unifdef
  INSTALL usr/include/asm-generic/ (37 files)
  INSTALL usr/include/drm/ (25 files)
  INSTALL usr/include/linux/ (488 files)
  INSTALL usr/include/linux/android/ (1 file)
  INSTALL usr/include/linux/byteorder/ (2 files)
  INSTALL usr/include/linux/caif/ (2 files)
  INSTALL usr/include/linux/can/ (6 files)
  INSTALL usr/include/linux/cifs/ (1 file)
  INSTALL usr/include/linux/dvb/ (8 files)
  INSTALL usr/include/linux/genwqe/ (1 file)
  INSTALL usr/include/linux/hdlc/ (1 file)
  INSTALL usr/include/linux/hsi/ (2 files)
  INSTALL usr/include/linux/iio/ (2 files)
  INSTALL usr/include/linux/isdn/ (1 file)
  INSTALL usr/include/linux/mmc/ (1 file)
  INSTALL usr/include/linux/netfilter/ (87 files)
  INSTALL usr/include/linux/netfilter/ipset/ (4 files)
  INSTALL usr/include/linux/netfilter_arp/ (2 files)
  INSTALL usr/include/linux/netfilter_bridge/ (17 files)
  INSTALL usr/include/linux/netfilter_ipv4/ (9 files)
  INSTALL usr/include/linux/netfilter_ipv6/ (12 files)
  INSTALL usr/include/linux/nfsd/ (5 files)
  INSTALL usr/include/linux/raid/ (2 files)
  INSTALL usr/include/linux/sched/ (1 file)
  INSTALL usr/include/linux/spi/ (1 file)
  INSTALL usr/include/linux/sunrpc/ (1 file)
  INSTALL usr/include/linux/tc_act/ (15 files)
  INSTALL usr/include/linux/tc_ematch/ (4 files)
  INSTALL usr/include/linux/usb/ (12 files)
  INSTALL usr/include/linux/wimax/ (1 file)
  INSTALL usr/include/misc/ (1 file)
  INSTALL usr/include/mtd/ (5 files)
  INSTALL usr/include/rdma/ (20 files)
  INSTALL usr/include/rdma/hfi/ (2 files)
  INSTALL usr/include/scsi/ (4 files)
  INSTALL usr/include/scsi/fc/ (4 files)
  INSTALL usr/include/sound/ (15 files)
  INSTALL usr/include/video/ (3 files)
  INSTALL usr/include/xen/ (4 files)
  INSTALL usr/include/asm/ (63 files)

```
