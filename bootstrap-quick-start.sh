#!/bin/bash -e

make toolchain-baremetal
make openocd-download
make fusesoc-download
make or1ksim-download
make linux-download

echo "++++++++++++++++++++++++++++++++++++++++++++++"
echo "++ Quick Start Bootstrap completed"
echo "++ Run the following command and you are ready"
echo "++     source environment.sh"
