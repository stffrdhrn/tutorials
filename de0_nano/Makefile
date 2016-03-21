build-hw:
	fusesoc build de0_nano

CFLAGS=-mboard=de0_nano -DDE0_NANO

build-sw:
	or1k-elf-gcc -g -o hello.elf $(CFLAGS) ../sw/hello/hello.c
	or1k-elf-gcc -g -o timer.elf $(CFLAGS) ../sw/timer/timer.c

program:
ifneq ($(wildcard de0_nano.sof),)
	quartus_pgm --mode=jtag -o p\;de0_nano.sof
else
	fusesoc pgm de0_nano
endif

