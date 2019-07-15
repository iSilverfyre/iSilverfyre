#!/bin/bash
# Collection of host tools.
# Created by Analicia - Version 1.0
clear
if [ "$1" = "" ]; then
    echo "You didn't specify a hostname, try again."
    echo "Use the following to properly execute script: sh host_tools.sh hostname"
	exit
fi

imscliResult=`imscli hostname $1`
verify=`echo "$imscliResult" | grep 'IMS did not return anything for:'`
if [ "$verify" = "" ]; then
hwid=`echo "$imscliResult" | grep 'HWID: ' | awk '{print $2}'`
ip=`echo "$imscliResult" |grep 'eth0 IP: ' |awk '{print $3}'`
pass=`echo "$imscliResult" |grep 'Password:' |grep -v 'IPMI Password:' |awk '{print $2}'`
else
	echo "Invalid hostname, try again."
	exit
fi
while true
do
	clear
	echo "=========================== HOST INFORMATION ==========================="
	echo "Hostname is $1"
	echo "Hardware ID is $hwid"
	echo "IP Address is $ip"
	echo "Password is $pass"
	echo "=========================== HOST INFORMATION ==========================="
	echo -e
	
	echo "==========================================="
	echo "Host Tools"
	echo "==========================================="
	echo "1 - Ping Host"
	echo "2 - Uptime"
	echo "3 - Restart Toolstack"
	echo "4 - Send VSEYES Email"
	echo "5 - Syncpower and Diagnostics"
	echo "6 - Enable KVM"
	echo "7 - Disable KVM"
	echo "8 - Exit to Main Menu"
	echo -e
	echo -e "Enter your selection: \c" 
	read answer
	
	case $answer in

		1)	ping $ip -c4 ;;

		2)	cloudcli -h $hwid hostuptime ;;

		3)	cloudcli -h $hwid apirestart ;;

		4)	vseyes $hwid -e ;;

		5)	echo "=========================== SYNC POWER ==========================="
			echo "Syncing Power for $1."
			cloudcli -h $hwid syncpower
			echo "=========================== SYNC POWER ==========================="
			echo "Beginning diagnostics of $1."
			logname=`date +%m.%d.%y`
			log=""~/Logs/""
			if [ -d "$log" ]; then
				echo -e
			else
				mkdir Logs
			fi
			ssh root@$ip < ./Tools/diag.sh > ./Logs/"$1"_"$logname".txt
 			echo "Diagnostic deaitls saved in Logs directroy under filename "$1"_"$logname".txt"
 			cat ./Logs/"$1"_"$logname".txt |less ;;

		6) 	slipmi ekvm -H $1 ;;

		7)	slipmi dkvm -H $1 ;;

		8)	exit ;;
	esac 
	echo "Press enter to continue."
	read input
done