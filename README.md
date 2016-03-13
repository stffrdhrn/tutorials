This repository contains instructions for building and running
tutorials with the OpenRISC processor.

The following steps are common to the different supported boards. When
running from a release archive (`openrisc-tutorials_*.tgz`), you will
only need OpenOCD and the toolchain if you want to build software
yourself. You can find more dependencies in the list below.

Once you have installed the general pre-requisites, you can do the
following tutorials.

* [Terasic DE0 nano board](de0_nano/README.md)
  * For running: OpenOCD
  * For building software: Toolchain
  * For building hardware: FuseSoC, Altera Quartus Prime

## OpenOCD

The OpenOCD version delivered with the Linux distributions is most
probably outdated. Hence, you can quickly install a current version
inside the tutorials:

	make openoce
	export OPENOCD=`pwd`/openocd

## Toolchain

The OpenRISC software tool chain consists of all the tools require to
compile and manipulate software for the platform. Specifically, the
tool chain which is considered the development version will be used to
compile code to run on the "bare metal" system. That is, with no
underlying operating system.

You will need the toolchain if you want to compile software. The quick
way just to play around with this tutorials is to run from the base
path:

	make toolchain
	export PATH=`pwd`/or1k-elf/bin:${PATH}

After downloading, you can also move the toolchain to a global path in
your filesystem, we recommend `/opt/toolchains/or1k-elf`, or even
[build](http://openrisc.io/newlib/building.html) the toolchain
yourself.

## FuseSoC

FuseSoC is an automated build environment and package manager for
OpenRISC. You can install it as described
[here](https://github.com/olofk/fusesoc).

## Altera Quartus Prime

