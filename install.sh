#!/bin/bash

echo "$(tput setaf 2)
     .~~.   .~~.
    '. \ ' ' / .'   $(tput sgr0)                 _                          _ $(tput setaf 1)
     .~ .~~~..~.    $(tput sgr0) ___ ___ ___ ___| |_ ___ ___ ___ _ _    ___|_|$(tput setaf 1)
    : .~.'~'.~. :   $(tput sgr0)|  _| .'|_ -| . | . | -_|  _|  _| | |  | . | |$(tput setaf 1)
   ~ (   ) (   ) ~  $(tput sgr0)|_| |__,|___|  _|___|___|_| |_| |_  |  |  _|_|$(tput setaf 1)
  ( : '~'.~.'~' : ) $(tput sgr0)    _____ _ |_|       _         |___|  |_|    $(tput setaf 1)
   ~ .~ (   ) ~. ~  $(tput sgr0)   |_   _|_|_____ ___| |__  ___ ___ ___        $(tput setaf 1)
    (  : '~' :  )   $(tput sgr0)     | | | |     | -_| | .'| . |_ -| -_|       $(tput setaf 1)
     '~ .~~~. ~'    $(tput sgr0)     |_| |_|_|_|_|___|_|__,|  _|___|___|       $(tput setaf 1)
         '~'        $(tput sgr0)                           |_|"

echo " "
echo "    Welcome to raspberry pi timelapse. A simple way to do timelapses with the pi camera module on a raspberry pi"
echo " "

# Filter root user
if [ $(id -u) -ne 0 ]
then 
	echo "Please run as root or use sudo command" 
	exit 1
fi

# get this folder
DIR=$(pwd)

# cp files to ... folder
cp -r "$DIR" /opt

# delete install scripts
sudo rm /opt/RPI_TimelapseCreator/install.sh
sudo rm /opt/RPI_TimelapseCreator/scripts/timelapse

# create the path to run
sudo cat scripts/timelapse > /usr/bin/timelapse
sudo chmod +x /usr/bin/timelapse

echo "installed"
