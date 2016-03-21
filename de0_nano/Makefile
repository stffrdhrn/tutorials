build-hw:
	fusesoc build de0_nano

build-sw:
	or1k-elf-gcc -g -o hello.elf -mboard=de0_nano ../sw/hello/hello.c
	or1k-elf-gcc -g -o timer.elf -mboard=de0_nano ../sw/timer/timer.c

program:
ifneq ($(wildcard de0_nano.sof),)
	quartus_pgm --mode=jtag -o p\;de0_nano.sof
else
	fusesoc pgm de0_nano
endif

