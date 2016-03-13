toolchain:
	wget https://github.com/openrisc/newlib/releases/download/v2.3.0-1/or1k-elf_gcc4.9.2_binutils2.26_newlib2.3.0-1_gdb7.11.tgz
	tar -xzf or1k-elf_gcc4.9.2_binutils2.26_newlib2.3.0-1_gdb7.11.tgz
	rm or1k-elf_gcc4.9.2_binutils2.26_newlib2.3.0-1_gdb7.11.tgz
	@echo "++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++ Downloaded the toolchain, add to your PATH:"
	@echo '++    export PATH=`pwd`/or1k-elf/bin:$${PATH}'

openocd:
	rm -rf openocd
	git clone git://repo.or.cz/openocd.git
	cd openocd; ./bootstrap; ./configure --enable-ftdi --enable-usb_blaster_libftdi --enable-maintainer-mode; make
	@echo "+++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++ Built openocd, add the following variable:"
	@echo '++    export OPENOCD=`pwd`/openocd'

.PHONY: openocd
