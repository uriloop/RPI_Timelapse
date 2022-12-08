#!/bin/bash

# create script
# add header and param 
PARAM=$1
PARAM2=$2
echo "#!/bin/bash" > newstop
echo "FOLDER=$PARAM" >> newstop
cat $PARAM2/scripts/stop.example >> newstop

# create the script in the folder
touch $PARAM/conf/stop.sh
# make it executable
chmod +x $PARAM/conf/stop.sh
#save the script in the folder
cat newstop > $PARAM/conf/stop.sh
rm newstop
