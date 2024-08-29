#!/bin/bash

SOFTWARE_NAME=xorgproto-2023.2
INSTALL_DIR=./install

WORKSPACE_DIR=`pwd`

if [ -d "${SOFTWARE_NAME}" ];then
    rm -rf ${SOFTWARE_NAME}
    rm -rf ${INSTALL_DIR}
    echo "Clean success"
fi

exit 0;