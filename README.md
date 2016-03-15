# OpenRISC Tutorials

This repository contains instructions for building and running
tutorials with the OpenRISC processor.

The following steps are common to the different supported simulations
and boards. When you have downloaded a release archive
(`openrisc-tutorials_*.tgz`), you will only need OpenOCD, and
optionally the toolchain if you want to build software yourself. You
can find more dependencies in the list below.

Once you have installed the general pre-requisites, you can do the
following tutorials.

* [Terasic DE0 nano board](de0_nano/README.md), dependencies:
  * For running: [OpenOCD](#openocd), [toolchain](#toolchain),
    [Altera Quartus Prime](#altera-quartus-prime)
  * For building hardware: [FuseSoC](#fusesoc)

## OpenOCD

The [OpenOCD](http://www.openocd.org) version delivered with the Linux
distributions is most probably outdated. Hence, you can quickly
install a current version inside the tutorials:

	make openocd
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

This is the software which compiles RTL and ultimately generates an
FPGA programming file. Unfortunately this software is closed source,
extremely large, and requires registration to download. However, it is
required.

For downloading the free version, visit the
[Altera website](http://dl.altera.com/?edition=lite) and
[download the latest version of Quartus Prime Lite](http://download.altera.com/akdlm/software/acdsinst/15.1/185/ib_tar/Quartus-lite-15.1.0.185-linux.tar). It
is 4.5GB in size and will obviously take a while to download. Once it
is downloaded, extract it and run the setup.sh file in there. Install
it to any location (e.g. `/opt/altera/lite`).

After installation add the following path (corrected for your
installation) to the search path:

	export PATH=/opt/altera/lite/15.1/quartus/bin/:$PATH

*Note:* Make sure you select to include the Cyclone IV E device
 families during installation.

## Debug Environment

The OpenRISC cpu, simulator and toolchain provide a full debugging 
environment with gdb and OpenOCD.  At a low level this is provided with 
[adv_debug_sys](https://github.com/olofk/adv_debug_sys) which provides
jtag interface for OpenOCD to talk to.  Much debugging can be done 
directly in OpenOCD.  GDB communicates with OpenOCD to provide a familiar
debugging environment for programmers.  For more details see: 

 * [Debugging OpenRISC](debugging/README.md)
