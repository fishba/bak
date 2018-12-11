#!/bin/bash
#需求是PING一个地址，延迟高于100ms就发送个邮件， 然后正常后在发个邮件通知 之后正常不发。
function tping(){
	PWD=`pwd`/$1
	if [ ! -e $PWD ];then
		echo "0" >$PWD
		n=`cat $PWD`
	else
		n=`cat $PWD`
	fi
	
	echo $n  $PWD
	ip=`ping -c 3 -W 1  $1 |awk -F/ 'END{print $6}'`
	if [ "$ip" == "" ];then
		if [ "$n" == "0" ];then
			echo $n
			echo ${1} "不通"
			#`pwd`/ding.sh "${2}"
			echo "1" >$PWD
		fi
	elif [ "$n" == "1" ];then
		echo "${2} 已经恢复正常。"
		echo "0" >$PWD
	fi

}

tping "10.40.90.254" "机房断电!"
tping "10.40.9.72" "操作部2#1楼断网!"
tping "10.40.9.74" "操作部3#1楼断网!"
tping "10.40.9.75" "操作部3#1楼中间交换机断网!"
tping "10.40.9.76" "操作部3#3楼断网!"
tping "10.40.60.5" "操作部2#2楼断网!"
tping "10.40.60.6" "操作部3#2楼断网!"
