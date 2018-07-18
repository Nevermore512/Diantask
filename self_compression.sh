#!/bin/bash
#脚本接收参数--list列出当前支持的压缩文件类型
if [ $# == 1 ]
then
        if [ "$1" == "--list" ]
        then
                echo "Supported file types: zip tar tar.gz tar.bz2"
	#打印用法
	elif [ "$1" != "--list" ]
        then
                echo "usage:2.self_compression.sh [--list] or [source compressed file] [Destination path]"
                echo "Self compression according to the file name suffix"
        fi
#打印用法
elif [ $# != 2 ]
then
                echo "usage:2.self_compression.sh [--list] or [source compressed file] [Destination path]"
                echo "Self compression according to the file name suffix"
#解压gz文件
elif [ "${1##*.}" == "gz" ]
then
	ungzipfile=${1%.*}
	if [[ "${ungzipfile##*.}" == "tar" ]];then
		if [ ! -d $2 ];then
                        mkdir $2
                fi
		tar -zxvf $1 -C $2
	fi
#解压zip文件
elif [ "${1##*.}" == "zip" ]
then	
	if [ ! -d $2 ];then
                mkdir $2
        fi
	unzip -o -d $2 $1 
#解压tar文件
elif [ "${1##*.}" == "tar" ]
then	
	if [ ! -d $2 ];then
                mkdir $2
        fi
        tar xvf $1 -C $2
#解压bz2文件
elif [ "${1##*.}" == "bz2" ]
then
	unbzfile=${1%.*}
        if [[ "${unbzfile##*.}" == "tar" ]];then
		if [ ! -d $2 ];then
			mkdir $2
		fi
                tar jxvf $1 -C $2
        fi
fi
