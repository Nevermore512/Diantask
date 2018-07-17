#!/bin/bash
#This shell is use for caculating factorial
factorial()
{
	local int=$1

	if [ $int == 0 ]   #判断输入是否为0
	then
		result=1
	else               #不为0时进入递归直到等于0  
		factorial `expr $int - 1`
		result=`expr $int \* $result`
	fi
	return $result
}
if [ -z $1 ]              #判断传递的参数是否为空
then
	printf "usage : input an integer and it will calculates it's factorial \n"
	exit 1
fi
factorial $1
echo $result
