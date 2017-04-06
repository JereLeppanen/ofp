#!/bin/bash -ex

ROOTDIR=$(git rev-parse --show-toplevel)

cd $ROOTDIR
git clone http://git.linaro.org/lng/odp.git
cd odp
git checkout tags/v1.11.0.0_monarch
./bootstrap
ODPDIR=$(pwd)/install
./configure --prefix=$ODPDIR
make install

cd $ROOTDIR
./bootstrap
./configure --with-odp=$ODPDIR --enable-cunit --prefix=$(pwd)/install
make install
make check
