#!/bin/bash

SOFTWARE_NAME=libXdmcp-1.1.4
INSTALL_DIR=./install

WORKSPACE_DIR=`pwd`

cd ${WORKSPACE_DIR}
if [ -d "${SOFTWARE_NAME}" ];then
    rm -rf ${SOFTWARE_NAME}
    rm -rf ${INSTALL_DIR}
    echo "Clean success"
fi

exit 0;