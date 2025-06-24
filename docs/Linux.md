---
title: Linux
layout: home
---

## Build OpenRISC linux image

### Prerequisites

#### Software

* Linux source code with OpenRISC patches
* or1k-elf toolchain
* or1ksim (optional)
* or1k-linux toolchain (optional)

#### Files
* Device tree file (*.dts, optional)
* Default Linux configuration (*_defconfig, optional)

### Setting up

OpenRISC is officially supported in the Linux kernel since 2011 and can be downloaded from https://www.kernel.org.
We do however recommend that you use the kernel from https://github.com/openrisc/linux/ as it contains some convenient
features such as a built-in initramfs and extra board configurations for OpenRISC not found in the upstream kernel.

#### Get Linux source code
git clone https://github.com/openrisc/linux

#### Set up Linux source code

    cd linux
    export ARCH=openrisc
    export CROSS_COMPILE=or1k-elf-

The device tree file (.dts) is used to specify hardware configuration settings, such as base addresses and interrupt numbers
for peripherals, memory sizes, the numbers of CPUs in the system and other things. If no custom device tree is used, a default one
is enabled that contains a UART at address 0x90000000, 32MB RAM and one CPU. These parameters should be available for any
OpenRISC system and can therefore be safely used. To enable more options, a separate device tree must be used

To add a new device tree

Copy `$NAME.dts` to arch/openrisc/boot/dts/

(Later, when you run `make menuconfig`, you can specify your device tree under Processor type and features->Builtin DTB)

The defconfig files is used to customize the Linux kernel for a certain hardware, e.g. enable
extra device drivers, networking, filesystems etc. For basic usage it is enough to use the built-in default
configuration. This will be enough to boot the kernel and communicate with it through a UART.

To use the built-in default configuration

`make defconfig`

To use a customized default configuration

Copy `$NAME_defconfig` to `arch/openrisc/configs/`

`make $NAME_defconfig`

To make further customizations

`make menuconfig`

To build the kernel

`make`

To load the kernel and start running it in openOCD run

```
init
reset
halt; load_image vmlinux; reg r3 0; reg npc 0x100; resume
```

The kernel image is now available as an elf file called `vmlinux`. This file can be used as any other bare-metal program for OpenRISC. To test the Linux image, you can:
* Run it in the reference C simulator (or1ksim)
* Run it on a simulated RTL model (Most likely extremely slow, unless using verilator)
* [Load it to RAM on an FPGA board with a debugger](Debugging.md)
* Program it to non-volatile flash on an FPGA board
