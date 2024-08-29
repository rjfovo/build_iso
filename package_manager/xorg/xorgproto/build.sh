#!/bin/bash

SOFTWARE_NAME=xorgproto-2023.2
PACKAGE_NAME=xorgproto-2023.2.tar.xz

CURR_PATH=`pwd`
XORG_PREFIX=/root/workspace/build_iso/package_manager/program/xorg

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

# ========================== Build ===================================

mkdir build &&
cd    build &&

meson setup --prefix=$XORG_PREFIX .. &&
ninja

ninja install &&
mv -v $XORG_PREFIX/share/doc/xorgproto{,-2023.2}

# =====================================================================

exit 0