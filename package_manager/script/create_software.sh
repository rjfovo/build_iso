#!/bin/bash

if [ $# != 1 ];then
    echo "create_software [project_name]"
    exit 0
fi

download_url=`cat package.list | grep $1 | awk '{print $3}'`
relative_path=`cat package.list | grep $1 | awk '{print $2}'`
if [ -z $relative_path ];then
    echo "Not found $1"
    exit 0
fi

project_path=../$relative_path/$1

mkdir -p ${project_path}
mkdir -p ${project_path}/install

cd ${project_path}
touch download.sh
touch build.sh
touch clean.sh

if [ ! -z $download_url ];then
    echo "#!/bin/bash"  > download.sh
    echo ""             >> download.sh
    echo "wget $download_url"             >> download.sh
    echo "exit 0"             >> download.sh
fi

exit 0