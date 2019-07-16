#!/bin/bash
# Simple menu based script complied to run multiple Compute SRE tools.
# Created by Analicia - Version 2.0
# ckhost.sh written by Javier Dominguez
while true
do

	folders=`find ~/.sretools/logs/ 2> /dev/null`
		if [ "$folders" = "" ]; then
			mkdir .sretools
			mkdir .sretools/logs
		fi

	clear
	echo "==========================================="
	echo "Compute SRE Tools Main Menu"
	echo "==========================================="
	echo "1 - Ticket Templates"
	echo "2 - Host Tools"
	echo "3 - DC Tools"
	echo "4 - Read Me"
	echo "5 - Exit"
	echo -e
	echo -e "Enter your selection: \c"
	read answer

# \/ Function for Option 1 - Ticket Templates \/
	ticket_tool ()
		{
		clear
		findsig=`find .sretools/ticket_sig 2> /dev/null`
		if [ "$findsig" = "" ]; then
		    echo "You don't have a signature setup."
			echo -e "Please enter your name: \c"
			read name
			echo -e "Please enter your title: \c"
			read title
echo "Thank you for choosing IBM Cloud,
$name
Compute SRE | $title" > ".sretools/ticket_sig"
		fi
		while true
		do
			clear
			echo "==========================================="
			echo "Ticket Templates"
			echo "==========================================="
			echo "1 - Cloud Host Outage Email"
			echo "2 - Emergency Migration"
			echo "3 - Bad Image"
			echo "4 - Hard Drive Hot Swap"
			echo "5 - Component Swap"
			echo "6 - Exit to the Main Menu"
			echo -e
			echo -e "Enter your selection: \c"
			read answer

			case $answer in

				1)	echo "What is the reason for the outage."
					read reason
					echo "================================================================================="
echo "**This is for internal tracking only.**

This host is back online and all vsi's are now available. The following was verified:

[x] Checked dmesg for errors.
[x] Verified the state of the storage arrays.
[x] Checked /var/log/messages.
[x] Checked ipmi logs for hardware errors.
[x] Run verify network to check for switch errors.
[x] Checked emails for outage history.
[x] Checked for large amounts of failed logins.
[x] Verified partitions are not full.
[x] Verified the filesystem is not read-only.
[x] Verified that /usr/local/scripts is mounted.

The following was found to be the cause of the outage: $reason

**This is for internal tracking only.**"
					echo "=================================================================================" ;;

				2)	echo "What failed?"
					read failure
					echo "================================================================================="
echo "Hello,

I'm opening this ticket to inform you of an emergency maintenance we had to perform on the host that your VSI was running on. Due to $failure failure, we've performed an emergency move of your VSI to a new host.

Please let us know if you need anything else. Or if there is a new issue please open a new support ticket.
"
cat .sretools/ticket_sig
					echo "=================================================================================" ;;

				3)	echo "Image ID"
					read imageid
					echo "Image Template Name"
					read templatename
					echo -e "it was discovered that your image \c"
					read imageissue
					echo "What is the FQDN?"
					read fqdn
					echo "What is the Private IP?"
					read privip
					echo "What is the Public IP?"
					read pubip
					echo "================================================================================="
echo "Hello,

This ticket has been created to let you know that after in-depth investigation, we have found an issue with your custom image template that will prevent it's use in our automation system.

Image ID: $imageid
Image Name: $templatename

During the recent provision of your VSI [$fqdn / $privip / $pubip], we encountered (an) issue(s) related to the Custom Image Template you are trying to use. During the provision, it was discovered that your image $imageissue We recommend that you investigate this issue on your source server and correct the noted issue. After that is done, please attempt to re-capture the image from the VSI or re-import the image from your own environment.

As this particular image has experienced an issue that prevents it from working with our automation, the image has been disabled and cannot be used.

Links:

https://console.bluemix.net/docs/infrastructure/image-templates/image_index.html#getting-started-with-image-templates
https://console.bluemix.net/docs/infrastructure/hardware-firewall-dedicated/ips.html#backend-private-network

Your new VSI will need to have access to our Service Network through any hardware or software firewalls including a ping check on each interface.
"
cat .sretools/ticket_sig
					echo "=================================================================================" ;;

				4)	echo -e "Hard Drive Number: hdd\c"
					read hdd
					echo "Serial Number"
					read serialnumber
					echo "Host HWO ID"
					read hwid
					echo "Host HWO Account Number"
					read hwacct
					echo "================================================================================="
echo "== DO NOT POWER DOWN SERVER! ==

DC, please HOT SWAP the drive (hdd$hdd) with the serial of ($serialnumber) in this chassis with an initialized new drive.

== DO NOT POWER DOWN SERVER! ==

Should you see that you have removed the wrong drive by mistake (verified by serial number) do NOT simply re-install it. Contact Compute SRE via Slack before doing anything.

Once the components are replaced, please lock the HWO with account number below, place the ticket yellow in the Compute > Internal Maintenance queue assigned to me so that we can monitor the rebuild.

Link: https://internal.softlayer.com/Hardware/update/$hwid
Account: $hwacct"
					echo "=================================================================================";;

				5)	echo -e "Please replace \c"
					read component
					echo "Host HWO ID"
					read hwid
					echo "Host HWO Account Number"
					read hwacct
					echo "================================================================================="
echo "== HOST IS EMPTY, OKAY TO POWER OFF! OKAY TO POWER OFF! ==

Please replace "$component"

Once the component is replaced, please lock the HWO with account number below, place the ticket yellow in the Compute > Internal Maintenance queue assigned to me so that I can review.

Thank you

Link: https://internal.softlayer.com/Hardware/update/$hwid
Account: $hwacct"
					echo "=================================================================================" ;;

				6) return ;;
			esac
			echo "Press enter to continue."
			read input
		done
	}
# /\ Function for Option 1 - Ticket Templates /\

# \/ Function for Option 2 - Host Tools \/
	host_tool ()
	{
	clear
		if [ "$1" = "" ]; then
		    echo "You didn't specify a hostname, try again."
			return
		fi
		echo "Please wait while host information is collected."
		imscliResult=`imscli hostname $1`
		verify=`echo "$imscliResult" | grep 'IMS did not return anything for:'`
		if [ "$verify" = "" ]; then
		hwid=`echo "$imscliResult" | grep 'HWID: ' | awk '{print $2}'`
		ip=`echo "$imscliResult" |grep 'eth0 IP: ' |awk '{print $3}'`
		pass=`echo "$imscliResult" |grep 'Password:' |grep -v 'IPMI Password:' |awk '{print $2}'`
		else
			echo "Invalid hostname, try again."
			return
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
			echo "3 - Change Ubuntu Boot Mode"
			echo "4 - Send VSEYES Email"
			echo "5 - Outage Diagnostics"
			echo "6 - Enable KVM"
			echo "7 - Disable KVM"
			echo "8 - Checked Freshly Reloaded Host"
			echo "9 - Exit to Main Menu"
			echo -e
			echo -e "Enter your selection: \c"
			read answer

			case $answer in

				1)	ping $ip -c4 ;;

				2)	ssh root@$ip uptime ;;

				3)	echo "Please provide the UUID of the VSI that you are working with."
					read vsiuuid
					host_tool $toolshn

					bootmode=`find ~/.sretools/bm.sh 2> /dev/null`
						if [ "$bootmode" = "" ]; then
						echo "#!/bin/bash
xe vm-param-set HVM-boot-policy="" uuid=
xe vm-param-set PV-bootloader=pygrub uuid=

						" > ~/.sretools/bm.sh
						fi
					ssh root@$ip > ~/.sretools/bm.sh ;;

				4)	vseyes $hwid -e ;;

				5)	echo "Beginning diagnostics of $1."
					logname=`date +%m.%d.%y`

					diag=`find ~/.sretools/diag.sh 2> /dev/null`
						if [ "$diag" = "" ]; then
						echo "#!/bin/bash
echo "--------------------------- DMESG ERROR ------------------------------"
dmesg -T |grep -i error
echo "--------------------------- DMESG ERROR ------------------------------"
echo -e
echo "--------------------------- DMESG FAIL ------------------------------"
dmesg -T |grep -i fail
echo "--------------------------- DMESG FAIL ------------------------------"
echo -e
echo "--------------------------- RAID CARD ------------------------------"
raid=""/opt/MegaRAID/""
if [ find "$raid" ]; then
	/opt/MegaRAID/storcli/storcli64 /c0 show
else
	/usr/Adaptec_Event_Monitor/arcconf getconfig 1
fi
echo "--------------------------- RAID CARD ------------------------------"
echo -e
echo "--------------------------- MESSAGE ERROR ------------------------------"
cat /var/log/messages |grep -i error
echo "--------------------------- MESSAGE ERROR ------------------------------"
echo -e
echo "--------------------------- MESSAGE FAIL ------------------------------"
cat /var/log/messages |grep -i fail
echo "--------------------------- MESSAGE FAIL ------------------------------"
echo -e
echo "--------------------------- IPMI ERROR ------------------------------"
ipmitool sel elist |more
echo "--------------------------- IPMI ERROR ------------------------------"
echo -e
echo "--------------------------- SSH ERROR ------------------------------"
cat /var/log/secure |grep ssh
echo "--------------------------- SSH ERROR ------------------------------"
echo -e
echo "--------------------------- DISK USAGE ------------------------------"
df -h
echo "--------------------------- DISK USAGE ------------------------------"
echo -e
echo "--------------------------- TOUCH TEST ------------------------------"
echo "Pass!" > touchtest
cat touchtest
rm -f touchtest
echo "--------------------------- TOUCH TEST ------------------------------"
echo -e
echo "--------------------------- SCRIPTS ------------------------------"
mount |grep scripts
echo "--------------------------- SCRIPTS ------------------------------"
						" > ~/.sretools/diag.sh
						fi
					ssh root@$ip < ~/.sretools/diag.sh > ~/.sretools/logs/outage_"$1"_"$logname".txt
		 			echo "Diagnostic deaitls saved in SRE Tools log directroy under filename outage_"$1"_"$logname".txt"
		 			cat ~/.sretools/logs/outage_"$1"_"$logname".txt |less ;;

				6) 	slipmi ekvm -H $1 ;;

				7)	slipmi dkvm -H $1 ;;

				8)	logname=`date +%m.%d.%y`

					ckhost=`find ~/.sretools/ckhost.sh/ 2> /dev/null`
						if [ "$ckhost" = "" ]; then
						echo "#!/usr/bin/env bash
echo "---------------------------------------------------------------"
echo "OS VERSION: "
cat /etc/*release
echo "---------------------------------------------------------------"
echo "UPTIME and SESSIONS: "
w
echo "---------------------------------------------------------------"
echo  "TOTAL RAM: "
dmidecode -t 17 | grep "Size.*MB" | awk '{s+=\$2} END {print s / 1024"GB"}'
dmidecode -t 17 | grep "Size.*GB" | awk '{s+=\$2} END {print s "GB"}'
echo "---------------------------------------------------------------"
echo "CPU INFO: "
lscpu
echo "---------------------------------------------------------------"
echo  "DISK INFO: "
fdisk -l
echo "---------------------------------------------------------------"
echo "MOUNTS: "
df -h
echo "---------------------------------------------------------------"
echo "RAID INFO: "
if [ -f /opt/MegaRAID/storcli/storcli64 ]; then
    echo "LSI CONTROLLER: "
    /opt/MegaRAID/storcli/storcli64 /c0 /vall show
    /opt/MegaRAID/storcli/storcli64 /c0 /eall /sall show
    /opt/MegaRAID/storcli/storcli64 /c0 /eall /sall show all | grep -iE 'det|cou|tem|SN|S.M|fir'
    /opt/MegaRAID/storcli/storcli64 /c0 /cv show status | grep -i status
elif [ -f /usr/Adaptec_Event_Monitor/arcconf ]; then
    echo "ADAPTEC CONTROLLER: "
    /usr/Adaptec_Event_Monitor/arcconf getconfig 1
    /usr/Adaptec_Event_Monitor/arcconf getlogs 1 device tabular
    /usr/Adaptec_Event_Monitor/arcconf getlogs 1 dead tabular
else
    echo "No raid controller installed."
fi
echo "---------------------------------------------------------------"
echo "NIC INFO: "
ip addr
echo "---------------------------------------------------------------"
echo "DMESG ERRORS: "
dmesg | egrep -i --color 'error|warning|critical|fatal'
echo "---------------------------------------------------------------"
echo "LAST REBOOT: "
last reboot
echo "---------------------------------------------------------------"
echo "FAILED LOGINS: "
cat /var/log/secure|grep ssh | grep fail
echo "---------------------------------------------------------------"
echo "IPMI SEL: "
ipmitool sel elist | tail
echo "---------------------------------------------------------------"
echo "TOUCH TEST: "
echo "Pass!" > touchtest
cat touchtest
rm touchtest
echo "---------------------------------------------------------------"
echo "VSIs: "
xe vm-list
echo "---------------------------------------------------------------"
						" > ~/.sretools/ckhost.sh
						fi

					ssh root@$ip < ~/.sretools/ckhost.sh > ~/.sretools/logs/check_host_"$1"_"$logname".txt
		 			echo "Host reload deaitls saved in SRE Tools log directroy under filename check_host_"$1"_"$logname".txt"
		 			cat ~/.sretools/logs/check_host_"$1"_"$logname".txt |less ;;

				9)	return ;;
			esac
			echo "Press enter to continue."
			read input
		done
	}
# /\ Function for Option 2 - Host Tools /\

# \/ Function for Option 3 - DC Tools \/
	dc_tool ()
	{
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

			5)	return ;;
		esac
		echo "Press enter to continue."
		read input
	done
	}
# /\ Function for Option 2 - DC Tools /\

	case $answer in

		1)	ticket_tool ;;

		2)	echo "Please provide the hostname of the server that you are working with."
			read toolshn
			host_tool $toolshn ;;

		3)	dc_tool ;;

		4)	echo "Readme file here" ;;

		5)	exit ;;
	esac
	echo -e "Press enter to continue. \c"
	read input
done