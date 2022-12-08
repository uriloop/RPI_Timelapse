#!/bin/bash
if [ $(id -u) -ne 0 ]
then 
        echo "Please run as root or use sudo command" 
        exit 1
fi

sudo rm /usr/bin/timelapse
sudo rm -r /opt/RPI_TimelapseCreator
