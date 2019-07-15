#!/bin/bash
# Host outage diagnostic
# Based off the requirements of https://confluence.softlayer.local/display/ISOPS/Cloud+Host+Outage+Emails
# Created by Analicia - Version 1.0

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
if [ -d "$raid" ]; then
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
echo "Pass! :)" > touchtest
cat touchtest
rm -f touchtest
echo "--------------------------- TOUCH TEST ------------------------------"
echo -e

echo "--------------------------- SCRIPTS ------------------------------"
mount |grep scripts
echo "--------------------------- SCRIPTS ------------------------------"