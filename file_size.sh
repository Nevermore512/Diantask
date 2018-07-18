#!/bin/bash
#不给脚本任何参数时默认当前路径
if [[ $# == 0 ]]
then
	du --max-depth=1 |sort -rn|awk '{print $2}'>/tmp/tmp
	echo "The largest files/directories in "`pwd`" are:"
	num=1
	cat /tmp/tmp|while read line
	do	
		if [ $line != "." ]
		then
			filesize=`du -h --max-depth=0 $line`
			echo $num	$filesize
			let num+=1
		fi
	done
#脚本通过-n N指定列出文件的个数,-d DIR指定路径
elif [ $# == 4 ] && [ $1 == "-n" ] && [ $3 == "-d" ]
then
	cd $4
	du --max-depth=1 |sort -rn|awk '{print $2}'>/tmp/tmp
        echo "The largest files/directories in "`pwd`" are:"
        num=1
	count=$2
	let count+=1
        head -n $count /tmp/tmp|while read line
        do
                if [ $line != "." ]
                then
                        filesize=`du -h --max-depth=0 $line`
                        echo $num       $filesize
                        let num+=1
                fi
        done
#说明用法
else 
	echo "usage: file_size.sh [-n N] [-d DIR]"
	echo "Show top N largest files/directories"
fi
	

