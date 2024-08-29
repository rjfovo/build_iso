#!/bin/bash

SOFTWARE_NAME=libXau-1.0.11
INSTALL_DIR=./install

WORKSPACE_DIR=`pwd`

cd ${WORKSPACE_DIR}
if [ -d "${SOFTWARE_NAME}" ];then
    rm -rf ${SOFTWARE_NAME}
    rm -rf ${INSTALL_DIR}
    echo "Clean success"
fi

exit 0;