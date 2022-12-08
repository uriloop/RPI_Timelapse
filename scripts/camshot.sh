#!/bin/bash
DIRNAME="$1"
echo "$DIRNAME"
DATE=$(date +"_%d-%m-%Y_%H:%M.jpg")
NUM=$(cat $DIRNAME/conf/contador.txt | awk '{printf "%04d\n", $0;}')
sh $DIRNAME/conf/contador.sh $DIRNAME
raspistill -o $DIRNAME/$NUM$DATE -n
