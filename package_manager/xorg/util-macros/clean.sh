#!/bin/bash

SOFTWARE_NAME=util-macros-1.20.0
INSTALL_DIR=./install

WORKSPACE_DIR=`pwd`
if [ -d "${SOFTWARE_NAME}" ];then
    rm -rf ${SOFTWARE_NAME}
    rm -rf ${INSTALL_DIR}
    echo "Clean success"
fi

exit 0;