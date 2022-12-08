#!/bin/bash

DIRNAME=$1
VALUE=$(cat $DIRNAME/conf/contador.txt)
SUMA=$(($VALUE+1))
echo $SUMA > $DIRNAME/conf/contador.txt
