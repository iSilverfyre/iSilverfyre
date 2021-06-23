#!/bin/bash

clear

echo "Moving to YubiKey CLI Directory"
cd /Applications/YubiKey\ Manager.app/Contents/MacOS/

echo ""
echo "Collecting Serial Information & Generating Key"
SERIAL=`./ykman list -s`
HEX=`echo "obase=16; $SERIAL" |bc`
KEY=000000$HEX
echo "Serial - "$SERIAL
echo "Key - "$KEY

echo ""
echo "Unlocking Slot 1"
./ykman otp --access-code $KEY settings --delete-access-code 1

echo ""
echo "Setting Static Password to Slot 2"
./ykman otp static -g -l 12 2

echo ""
echo "Enabling FIDO"
./ykman config mode o+f
read -p "Press enter after YubiKey has been reinserted."

echo ""
echo "Locking Slot 1"
./ykman otp --access-code $KEY settings 1

echo ""
echo "Locking Slot 2"
./ykman otp --access-code $KEY settings 2

# echo ""
# echo "Locking FIDO"
# ./ykman fido access change-pin --u2f -n $KEY

echo ""
echo "Validating Key"
echo "UBHE"$SERIAL" FIPS" >> ~/Desktop/serial-log.txt
echo "UBHE"$SERIAL" FIPS" >> ~/Desktop/validaton-verification.txt

echo ""
echo "OTP Validation"
./ykman otp info

# echo ""
# echo "FIDO Validation"
# ./ykman fido info

echo ""
echo "Saving Validation Logs"
echo "Saving OTP Log"
echo "OPT Log" >> ~/Desktop/validaton-verification.txt
./ykman otp info >> ~/Desktop/validaton-verification.txt

# echo "Saving FIDO Log"
# echo "OPT Log" >> ~/Desktop/validaton-verification.txt
# ./ykman fido info; echo "" >>~/Desktop/validaton-verification.txt

echo ""
echo "Key Complete - Please Remove" $SERIAL