#!/bin/bash

if [ -d toolchains/or1k-elf ]; then
    export PATH=$PWD/toolchains/or1k-elf/bin:$PATH
fi

if [ -d tools/openocd ]; then
    export OPENOCD=$PWD/tools/openocd
    export PATH=$PWD/tools/openocd/bin:$PATH
fi

if [ -d tools/fusesoc ]; then
    export PATH=$PWD/tools/fusesoc/bin:$PATH
    export PYTHONPATH=$PWD/tools/fusesoc/lib/python2.7/site-packages/
fi

if [ -d tools/or1ksim ]; then
    export PATH=$PWD/tools/or1ksim/bin:$PATH
fi
