#!/bin/bash

clear

USERNAME=$(whoami)
WHEREAMI=$(pwd)

clear

XPASS=$(zenity --password --title="$USERNAME")
xpass="$XPASS"

clear

REQ1=$(which git)
req1="$REQ1"
REQ2=$(which zenity)
req2="$REQ2"
REQ3=$(which notify-send)
req3="$REQ3"

clear

# REQ1
if [ $req1 = "/usr/bin/git" ]
then
	echo "REQ1=TRUE"
else
	echo $xpass | sudo -S apt-get -y install git
fi

# REQ2
if [ $req2 = "/usr/bin/zenity" ]
then
	echo "REQ2=TRUE"
else
	echo $xpass | sudo -S apt-get -y install zenity
fi

# REQ3
if [ $req3 = "/usr/bin/notify-send" ]
then
	echo "REQ3=TRUE"
else
	echo $xpass | sudo -S apt-get -y install notify-send
fi

clear

SEARCH=$(zenity --entry --title="Archimedes v1.0" --text="Search ARC-ID: " --width="348" --height="126" --ok-label="Search" --cancel-label="Quit")
search="$SEARCH"

clear

ITEM=$(grep --count "$search" /home/$USERNAME/Desktop/archimedes/arclib)
item="$ITEM"

clear

if [ $item -gt "0" ]
then
	TOPIC=$(cat /home/$USERNAME/Desktop/archimedes/$search.bak)
	topic="$TOPIC"
	notify-send --urgency="critical" --icon="/home/$USERNAME/Desktop/archimedes/icon.svg" "Archimedes Says.." "$topic"
else
	notify-send --urgency="critical" --icon="/home/$USERNAME/Desktop/archimedes/icon.svg" "Archimedes Says.." "Unknown.."
fi

clear
