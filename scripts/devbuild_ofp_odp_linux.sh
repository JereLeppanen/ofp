#!/bin/bash

set -ex

export ROOTDIR=$(git rev-parse --show-toplevel)

cd $ROOTDIR
git clone https://git.linaro.org/lng/odp.git
cd odp
git checkout tags/v1.11.0.0_monarch
./bootstrap
ODPDIR=$(pwd)/install
./configure --prefix=$ODPDIR
make
make install

cd $ROOTDIR
./bootstrap
./configure --with-odp=$ODPDIR --enable-cunit --prefix=$ROOTDIR/install
make
make install
make check