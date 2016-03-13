build-hw:
	fusesoc build de0_nano
	cp build/de0_nano/bld-quartus/de0_nano.sof de0_nano.sof

build-sw:
	or1k-elf-gcc -g -o hello.elf -mboard=de0_nano ../sw/hello/hello.c
	or1k-elf-gcc -g -o timer.elf -mboard=de0_nano ../sw/timer/timer.c

download:
	quartus_pgm --mode=jtag -o p\;de0_nano.sof

