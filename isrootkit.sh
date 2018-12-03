#!/bin/bash

str_pids="`ps -A | awk '{print $1}'`";
for i in /proc/[[:digit:]]*;
do
	if echo "$str_pids" | grep -qs `basename "$i"`;
	then
		:
	else
		echo "Rootkit's PID: $(basename "$i")";
	fi
done
