#!/bin/bash

# number of arguments
NUMARG="$#"

if [ $NUMARG -eq 1 ] ; then
	case $1 in
		"-s")
			echo "stop"
		;;
		"-u")
			echo "uninstall"
		;;
		"-n")
			echo "new"
		;;
		*)
			echo "-n = new timelapse\n-s = stop timelapse\n-u = uninstall timelapse app"
	esac
elif [ $NUMARG -lt 1 ] || [ $NUMARG -gt 2 ] ; then
	echo "aki mostrar help"
fi




read -p "Enter a directory name: " DIRN
read -p "Enter the minutes between captures (max 59)" MINUTES2

# create directory
mkdir $DIRN

# get path to directory
DIRNPATH=$(realpath $DIRN)
# get path to app
APPPATH="$(dirname "$0")"

# create conf dir
mkdir $DIRNPATH/conf
# cp the scripts to the folder
cp $APPPATH/scripts/camshot.sh $DIRNPATH/conf
cp $APPPATH/scripts/contador.sh $DIRNPATH/conf
# initialize the contador in the folder
echo "0" > $DIRNPATH/conf/contador.txt

# get the time representation for crontab

if [ "$MINUTES2" -lt "59" ];then
	if [ "$MINUTES2" -gt "1" ];then
		TIME2='*/'$MINUTES2' * * * * '
	else
		TIME2='* * * * * '
	fi
else
	TIME2='* * * * * '
fi

#get the camera script absolute path
SCRPT=$DIRNPATH/conf/camshot.sh
#echo "camshotpath $SCRPT"
PATH3=$(realpath $SCRPT)

# get the entire crontab command
COMMAND2=" sh "$PATH3" "$DIRNPATH" 2> "$DIRNPATH"/hola.txt"
CRONLINE1="$TIME2$COMMAND2"
CRONLINE2="## timelapseCreator_v2  folder=$DIRNPATH"


#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "$CRONLINE2" >> mycron
echo "$CRONLINE1" >> mycron

#install new cron file
crontab mycron
rm mycron

# create stop script in the same directory
# params = folder
sh $APPPATH/scripts/stopgen.sh $DIRNPATH $APPPATH 
