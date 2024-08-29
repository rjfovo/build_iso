#!/bin/bash

SOFTWARE_NAME=util-macros-1.20.0
PACKAGE_NAME=util-macros-1.20.0.tar.xz

CURR_PATH=`pwd`
XORG_PREFIX=/root/workspace/build_iso/package_manager/program/xorg
XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=${XORG_PREFIX}/etc --localstatedir=${XORG_PREFIX}/var --disable-static"

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${XORG_PREFIX}/lib

if [ -d "${SOFTWARE_NAME}" ];then
    rm -rf ./${SOFTWARE_NAME}
    echo "Remove ${SOFTWARE_NAME} success"
fi

echo "Start build ${SOFTWARE_NAME}"
tar -xf ${PACKAGE_NAME}

if [ ! -d "${SOFTWARE_NAME}" ];then
    echo "decompress ${SOFTWARE_NAME} failed"
    exit 0
fi
cd ${SOFTWARE_NAME}

./configure $XORG_CONFIG
make
make install

exit 0