#!/bin/bash -ex

ROOTDIR=$(git rev-parse --show-toplevel)

cd $ROOTDIR
git clone --depth 1 -b v1.11.0.0_monarch http://git.linaro.org/lng/odp.git
cd odp
./bootstrap
ODPDIR=$(pwd)/install
./configure --prefix=$ODPDIR
make install

cd $ROOTDIR
./bootstrap
./configure --with-odp=$ODPDIR --enable-cunit --prefix=$(pwd)/install
make install
make check
