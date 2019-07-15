#!/bin/bash
# Compute SRE Tools - Ticket Templates
# Created by Analicia - Version 2.0

clear
	findsig=`find .ticket_sig 2> /dev/null`
	if [ "$findsig" = "" ]; then
	    echo "You don't have a signature setup."
		echo -e "Please enter your name: \c"
		read name
		echo -e "Please enter your title: \c"
		read title
		echo "Thank you for choosing IBM Cloud,
$name
Compute SRE | $title" > ".ticket_sig"
		fi
while true
do
clear
	echo "==========================================="
	echo "Compute SRE Ticket Templates"
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
#************************************************************************************************************************
#************************************************************************************************************************
#************************************************************************************************************************
#************************************************************************************************************************
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
#************************************************************************************************************************
#************************************************************************************************************************
		2)	echo "What failed?"
			read failure
			echo "================================================================================="
echo "Hello,

I'm opening this ticket to inform you of an emergency maintenance we had to perform on the host that your VSI was running on. Due to $failure failure, we've performed an emergency move of your VSI to a new host.

Please let us know if you need anything else. Or if there is a new issue please open a new support ticket.
"
cat .ticket_sig
			echo "=================================================================================" ;;
#************************************************************************************************************************
#************************************************************************************************************************
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
cat .ticket_sig
			echo "=================================================================================" ;;
#************************************************************************************************************************
#************************************************************************************************************************
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
#************************************************************************************************************************
#************************************************************************************************************************
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
#************************************************************************************************************************
#************************************************************************************************************************
		6) exit ;;
	esac
	echo "Press enter to continue."
	read input
done