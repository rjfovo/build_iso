#!/bin/bash

SOFTWARE_NAME=libxcb-1.16
PACKAGE_NAME=libxcb-1.16.tar.xz

CURR_PATH=`pwd`
XORG_PREFIX=/root/workspace/build_iso/package_manager/program/xorg
XORG_CONFIG="--prefix=$XORG_PREFIX --sysconfdir=${XORG_PREFIX}/etc --localstatedir=${XORG_PREFIX}/var --disable-static"

export LD_LIBRARY_PATH=${XORG_PREFIX}/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$XORG_PREFIX/lib/pkgconfig:$XORG_PREFIX/share/pkgconfig:$PKG_CONFIG_PATH
export LIBRARY_PATH=$XORG_PREFIX/lib:${LIBRARY_PATH}
export C_INCLUDE_PATH=$XORG_PREFIX/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$XORG_PREFIX/include:$CPLUS_INCLUDE_PATH


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
./configure $XORG_CONFIG      \
            --without-doxygen \
            --docdir=${XORG_PREFIX}/share/doc/libxcb-1.16 &&
LC_ALL=en_US.UTF-8 make

make check

make install
# =====================================================================

exit 0