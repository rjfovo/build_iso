#!/bin/bash

if [ $# != 1 ];then
    echo "create_software [project_name]"
    exit 0
fi

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

chmod u+x download.sh
./download.sh

exit 0