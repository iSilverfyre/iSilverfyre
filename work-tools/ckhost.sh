#!/usr/bin/env bash
#test host script
#Created by Javier - Version 1.0
 
printf "\n---------------------------------------------------------------\n"
 
printf "\nOS VERSION: \n"
cat /etc/*release
 
printf "\n---------------------------------------------------------------\n"
 
 
printf "\nUPTIME and SESSIONS: \n"
w
 
printf "\n---------------------------------------------------------------\n"
 
printf  " \nTOTAL RAM: \n"
dmidecode -t 17 | grep "Size.*MB" | awk '{s+=$2} END {print s / 1024"GB"}'
dmidecode -t 17 | grep "Size.*GB" | awk '{s+=$2} END {print s "GB"}'
 
printf "\n---------------------------------------------------------------\n"
 
printf "\nCPU INFO: \n"
lscpu
 
printf "\n---------------------------------------------------------------\n"
 
printf  " \nDISK INFO: \n"
fdisk -l
 
printf "\n---------------------------------------------------------------\n"
 
printf  " \nMOUNTS: \n"
df -h
 
printf "\n---------------------------------------------------------------\n"
 
printf  " \nRAID INFO: \n"
 
if [ -f /opt/MegaRAID/storcli/storcli64 ]; then
    printf "*LSI CONTROLLER: \n"
    /opt/MegaRAID/storcli/storcli64 /c0 /vall show
    read anykey
    /opt/MegaRAID/storcli/storcli64 /c0 /eall /sall show
    read anykey
    /opt/MegaRAID/storcli/storcli64 /c0 /eall /sall show all | grep -iE "det|cou|tem|SN|S.M|fir"
    read anykey
    /opt/MegaRAID/storcli/storcli64 /c0 /cv show status | grep -i status
 
elif [ -f /usr/Adaptec_Event_Monitor/arcconf ]; then
    printf "ADAPTEC CONTROLLER: \n"
    /usr/Adaptec_Event_Monitor/arcconf getconfig 1
    read anykey
    /usr/Adaptec_Event_Monitor/arcconf getlogs 1 device tabular
    read anykey
    /usr/Adaptec_Event_Monitor/arcconf getlogs 1 dead tabular
else
    printf "\nNo raid controller installed. \n"
fi
 
printf "\n---------------------------------------------------------------\n"
 
printf "\nNIC INFO: \n"
ip addr
 
printf "\n---------------------------------------------------------------\n"
 
printf "\nDMESG ERRORS: \n"
dmesg | egrep -i --color 'error|warning|critical|fatal'
 
printf "\n---------------------------------------------------------------\n"
 
printf "\nLAST REBOOT: \n"
last reboot
 
printf "\n---------------------------------------------------------------\n"
 
printf "\nFAILED LOGINS: \n"
cat /var/log/secure|grep ssh | grep fail
 
printf "\n---------------------------------------------------------------\n"
 
printf "\nIPMI SEL: \n"
ipmitool sel elist | tail
 
printf "\n---------------------------------------------------------------\n"
 
printf "\nTOUCH TEST: \n"
echo "Pass! :)" > touchtest
cat touchtest
rm touchtest
 
printf "\n---------------------------------------------------------------\n"
 
printf "\n*** VSI's: *** \n"
xe vm-list
 
printf "\n---------------------------------------------------------------\n"