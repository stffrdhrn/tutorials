all: 

toolchain-baremetal:
	mkdir -p toolchains
	rm -f or1k-elf_gcc5.2.0_binutils2.26_newlib2.3.0-1_gdb7.11.tgz
	wget https://github.com/openrisc/newlib/releases/download/v2.3.0-1/or1k-elf_gcc5.2.0_binutils2.26_newlib2.3.0-1_gdb7.11.tgz
	tar -xzf or1k-elf_gcc5.2.0_binutils2.26_newlib2.3.0-1_gdb7.11.tgz -C toolchains
	rm or1k-elf_gcc5.2.0_binutils2.26_newlib2.3.0-1_gdb7.11.tgz
	@echo "++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++ Downloaded the toolchain successfully."
	@echo "++ Run '. environment.sh' or add manually to your PATH:"
	@echo '++    export PATH=`pwd`/toolchains/or1k-elf/bin:$${PATH}'

openocd-build:
	rm -rf tools/src/openocd
	mkdir -p tools/src
	git clone git://repo.or.cz/openocd.git tools/src/openocd
	cd tools/src/openocd; ./bootstrap; ./configure --enable-ftdi --enable-usb_blaster_libftdi --enable-maintainer-mode --prefix=${PWD}/tools/openocd; make && make install
	@echo "++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++ Built openocd successfully."
	@echo "++ Run '. environment.sh' or add set those variables manually:"
	@echo '++    export OPENOCD=`pwd`/tools/openocd/'
	@echo '++    export PATH=`pwd`/tools/openocd/bin:$${PATH}'

openocd-download:
	rm -rf tools/openocd
	wget https://github.com/openrisc/tutorials/releases/download/2016.1/openocd.tgz
	mkdir -p tools
	tar -xzf openocd.tgz -C tools
	rm openocd.tgz
	@echo "++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++ Downloaded openocd successfully."
	@echo "++ Run '. environment.sh' or add set those variables manually:"
	@echo '++    export OPENOCD=`pwd`/tools/openocd/'
	@echo '++    export PATH=`pwd`/tools/openocd/bin:$${PATH}'

fusesoc-build:
	rm -rf tools/src/fusesoc
	mkdir -p tools/src
	git clone https://github.com/olofk/fusesoc.git tools/src/fusesoc
	cd tools/src/fusesoc; autoreconf -i; ./configure --prefix=${PWD}/tools/fusesoc; make && make install
	@echo "++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++ Built fusesoc successfully."
	@echo "++ Run '. environment.sh' or add set those variables manually:"
	@echo '++    export PATH=`pwd`/tools/fusesoc/bin:$${PATH}'
	@echo '++    export PYTHONPATH=`pwd`/tools/fusesoc/lib/python2.7/site-packages/'

fusesoc-download:
	rm -rf tools/fusesoc
	wget https://github.com/openrisc/tutorials/releases/download/2016.1/fusesoc.tgz
	mkdir -p tools
	tar -xzf fusesoc.tgz -C tools
	@echo "++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++ Downloaded fusesoc successfully."
	@echo "++ Run '. environment.sh' or add set those variables manually:"
	@echo '++    export PATH=`pwd`/tools/fusesoc/bin:$${PATH}'
	@echo '++    export PYTHONPATH=`pwd`/tools/fusesoc/lib/python2.7/site-packages/'

or1ksim-build:
	rm -rf tools/src/or1ksim
	mkdir -p tools/src
	git clone https://github.com/openrisc/or1ksim.git tools/src/or1ksim
	cd tools/src/or1ksim; mkdir build; cd build; ../configure --prefix=${PWD}/tools/or1ksim --program-prefix=or1k-; make && make install
	@echo "++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++ Built or1ksim successfully."
	@echo "++ Run '. environment.sh' or add set those variables manually:"
	@echo '++    export PATH=`pwd`/tools/or1ksim/bin:$${PATH}'

or1ksim-download:
	rm -rf tools/or1ksim
	wget https://github.com/openrisc/tutorials/releases/download/2016.1/or1ksim.tgz
	mkdir -p tools
	tar -xzf or1ksim.tgz -C tools
	@echo "++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++ Downloaded or1ksim successfully."
	@echo "++ Run '. environment.sh' or add set those variables manually:"
	@echo '++    export PATH=`pwd`/tools/or1ksim/bin:$${PATH}'

linux-download:
	rm -f vmlinux
	wget https://github.com/openrisc/tutorials/releases/download/2016.1/vmlinux
	@echo "++++++++++++++++++++++++++++++++++++++++++++++"
	@echo "++ Downloaded vmlinux image successfully"
