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
