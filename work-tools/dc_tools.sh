#!/bin/bash
# Collection of DC tools.
# Created by Analicia - Version 1.0
while true
do
	clear
	echo "==========================================="
	echo "DC Tools"
	echo "==========================================="
	echo "1 - Restart Toolstack - Single Rack"
	echo "2 - Restart Toolstack - Whole Pod"
	echo "3 - Syncpower - Single Rack"
	echo "4 - Syncpower - Whole Pod"
	echo "5 - Exit to Main Menu"
	echo -e
	echo -e "Enter your selection: \c" 
	read answer
	
	case $answer in

		1)	echo "What DC is the toolstack reset required in?"
			read tsrdc
			echo -e "What Server Room is the toolstack reset in? - SR\c" 
			read tsrsr
			echo -e "What rack is the toolstack reset on? - RK\c"
			read tsrrk
			cloudcli -s $tsrdc.sr$tsrsr.rk$tsrrk apirestart ;;

		2)	echo "What DC is the toolstack reset required in?"
			read tspdc
			echo -e "What Server Room is the toolstack reset in? - SR\c" 
			read tspsr
			cloudcli -s $tspdc.sr$tspsr apirestart ;;

		3)	echo "What DC is the syncpower required in?"
			read sprdc
			echo -e "What Server Room is the syncpower in? - SR\c" 
			read sprsr
			echo -e "What rack is the syncpower on? - RK\c"
			read sprrk
			cloudcli -s $sprdc.sr$sprsr.rk$sprrk syncpower ;;

		4)	echo "What DC is the syncpower required in?"
			read sppdc
			echo -e "What Server Room is the syncpower in? - SR\c" 
			read sppsr
			cloudcli -s $sppdc.sr$sppsr syncpower ;;

		5)	exit ;;
	esac 
	echo "Press enter to continue."
	read input
done