#!/bin/bash

if [ $# != 1 ];then
    echo "create_software [project_name]"
    exit 0
fi

CURR_PATH=`pwd`

if [ "$1" == "all" ];then
    while read line
    do
        libname=`echo ${line} | awk '{print $1}'`
        relative_path=`echo ${line} | awk '{print $2}'`

        project_path=../$relative_path/${libname}
        if [ ! -d "${project_path}" ];then
            echo ${project_path}" not exist. Please create!"
            exit 0
        fi

        cd "${project_path}"
        pwd

        chmod u+x build.sh
        ./build.sh

        cd ${CURR_PATH}
    done < package.list
else
    relative_path=`cat package.list | grep $1 | awk '{print $2}'`
    if [ -z $relative_path ];then
        echo "Not found $1"
        exit 0
    fi

    project_path=../$relative_path/$1

    if [ ! -d "${project_path}" ];then
        echo ${project_path}" not exist. Please create!"
        exit 0
    fi

    cd "${project_path}"
    pwd

    chmod u+x build.sh
    ./build.sh
fi

exit 0