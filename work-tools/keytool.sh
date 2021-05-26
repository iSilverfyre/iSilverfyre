#!/bin/bash

clear

printf "Moving to YubiKey CLI Directory"
cd /Applications/YubiKey\ Manager.app/Contents/MacOS/

printf "\nCollecting Serial Information & Generating Key"
SERIAL=`./ykman list -s`
HEX=`echo "obase=16; $SERIAL" |bc`
KEY=000000$HEX
printf $KEY

printf "\nUnlocking Slot 1"
./ykman otp --access-code $KEY settings --delete-access-code 1

printf "\nSetting Static Password to Slot 2"
./ykman otp static -g -l 12 2

printf "\nEnabling FIDO"
./ykman config mode o+f
read -p "Press enter after YubiKey has been reinserted."

printf "\nLocking Slot 1"
./ykman otp --access-code $KEY settings 1

printf "\nLocking Slot 2"
./ykman otp --access-code $KEY settings 2

printf "\nLocking FIDO"

printf "\n\nValidation"
./ykman otp info && ./ykman fido info