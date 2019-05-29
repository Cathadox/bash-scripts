#!/bin/bash

#Default values for date and time running without -d opt
TIMESTR=$1
TIMEARG=$(expr $1 + 0 2> /dev/null)
CURRSTR=$(date +"%d%m%y")
DATESTR=$CURRSTR
CURRDATE=$(expr $(date +"%d%m%y") + 0)
DATEARG=$CURRDATE

while getopts "d:h" opt; do
	case ${opt} in
#Show HELP DIALOG
		h )
			echo "Usage: "
			echo "Is used to schedule specific command execution"
			echo "nostradamus -h			Display this help message"
			echo "nostradamus -d			Insert date for <DDMMYY> then time for <HHMM>"
			echo "nostradamus			Set time for <HHMM> ***in span of 24h***"
			exit 1
			;;
		d )
#Sets DATEARG as schedule-date, DATESTR to print schedule-date, TIMEARG as schedule-time and TIMESTR to print schedule-time
			DATEARG=$(expr $OPTARG + 0)
			DATESTR=$OPTARG
			TIMESTR=$3
			TIMEARG=$(expr $3 + 0)
			;;
		\? )
			echo "Invalid option -$OPTARG" 1>&2
			exit 1
			;;
	esac
done

#Typing your command
echo "Enter your command:"
read COMARG
#Printing command and when it is scheduled to execute
echo "Command: '$COMARG' scheduled for: time: ${TIMESTR:0:2}:${TIMESTR:2:2}:00, date: $(date --date=${DATESTR:4}${DATESTR:2:2}${DATESTR:0:2} +"%A %d %B %Y") "
for ((; ;))
do
#Checking if DATEARG is the same day as CURRDATE
	if [ "$DATEARG" != "$CURRDATE" ]
	then
		sleep 1m
	else	
#Changing CURRTIME format from STRING to INTEGER in one line
		CURRTIME=$(expr $(date +"%H%M") + 0)	
#CONDITION if CURRTIME is the time needed for the command to execute
		if [ "$CURRTIME" == "$TIMEARG" ]
		then
			eval $COMARG
			exit 1
		else
#If the CURRTIME is one minute before the actual time, check every second
#Else every minute
			if [ "$CURRTIME" == "$(( $TIMEARG - 1 ))" ]
			then
				sleep 1
			else
				sleep 1m
			fi
		fi
	fi
