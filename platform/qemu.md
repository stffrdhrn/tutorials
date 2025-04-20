The objective of this tutorial is to run a Hello World program on QEMU. The prerequisite is to have a [cross-compiler](https://openrisc.io/software) for OpenRISC 1000 (or1k). And don't forget to add it to the `PATH` .

# Intro
QEMU is a generic emulator that supports various target architectures. [It can be used to emulate a 32-bit OpenRISC CPU](https://www.qemu.org/docs/master/system/targets.html).\
QEMU has two different modes of emulation: user mode and system emulation mode. The user mode only allows you to run programs compiled for the target architecture, while the system mode emulates the complete hardware. 

# User Mode
## Install QEMU
To install QEMU package on Ubuntu, run\
```sudo apt install qemu-user-static```  
for running statically linked binaries OR\
```sudo apt install qemu-user```  
for running dynamically linked binaries. Personally, I am using the static version for this example.

## Cross-compile The Program
`hello.c` is included in this directory. Compile it using the cross-compiler you have. For me, the command is\
```or1k-none-linux-musl-gcc hello.c -static -o hello```

And check if the output file type looks correct using `file` command.
```
file hello
hello: ELF 32-bit MSB executable, OpenRISC, version 1 (SYSV), statically linked, with debug_info, not stripped
```

Note that `-static` flag was used when compiling. Without this, the output will be a dynamically linked ELF, which will give an error, ```qemu-or1k-static: Could not open '/lib/ld-musl-or1k.so.1': No such file or directory```, if we try to run it using qemu-or1k-static. 

## Run the program
```qemu-or1k-static hello```\
if he output is ```Hello World!```, then everything is working correctly.

# System Emulation
## Install QEMU
To install QEMU package on Ubuntu, run
```sudo apt install qemu-system```  


