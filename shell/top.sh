#!/bin/sh

if [ $# -lt 1 ]; then
	echo "Usage: ./top.sh pid"
fi

pid=$1
top -b -c -d3 -p$pid > top.$pid &
