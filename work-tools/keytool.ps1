# check if running with elevated rights
$IsAdmin=(new-object System.Security.Principal.WindowsPrincipal([System.Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
if ($IsAdmin -eq $false)
{
write-host "You must run as Administrator.   exiting now..."
break
}

Write-Host "Moving to YubiKey CLI Directory"
cd 'C:\Program Files\Yubico\YubiKey Manager'
Write-Host ""
Write-Host "Collecting Serial Information & Generating Key"
[int]$SERIAL=""
$SERIAL=.\ykman.exe list -s
$HEX="{0:X}" -f $SERIAL
$KEY=$HEX.PadLeft(12,'0')
Write-Host "Serial - "$SERIAL
Write-Host "Key - "$KEY

Write-Host ""
Write-Host "Unlocking Slot 1"
.\ykman.exe otp --access-code $KEY settings --delete-access-code 1

Write-Host ""
Write-Host "Setting Static Password to Slot 2"
.\ykman.exe otp static -g -l 12 2

Write-Host ""
Write-Host "Enabling FIDO"
.\ykman.exe config mode o+f
Read-Host "Remove and reinsert Yubikey, once the light is green, press enter"

Write-Host ""
Write-Host "Locking Slot 1"
.\ykman.exe otp --access-code $KEY settings 1

Write-Host ""
Write-Host "Locking Slot 2"
.\ykman.exe otp --access-code $KEY settings  2

# Write-Host ""
# Write-Host "Locking FIDO"
# .\ykman.exe fido access change-pin --u2f -n $KEY

Write-Host ""
Write-Host "Validating Key"
"UBHE$SERIAL FIPS" | Out-File -FilePath ~\Desktop\serial-log.txt -Append
"UBHE$SERIAL FIPS" | Out-File -FilePath ~\Desktop\validation-verification.txt -Append
Write-Host "OTP Validation"
$OTP=.\ykman.exe otp info
# Write-Host ""
# Write-Host "FIDO Validation"
# $FIDO=.\ykman.exe fido info

Write-Host ""
Write-Host "Saving Validation Logs"
Write-Host "Saving OTP Logs"
"OTP Log" | Out-File -FilePath ~\Desktop\validation-verification.txt -Append
$OTP  | Out-File -FilePath ~\Desktop\validation-verification.txt -Append
# Write-Host "Saving FIDO Logs"
# "FIDO Log" | Out-File -FilePath ~\Desktop\validation-verification.txt -Append
# $FIDO | Out-File -FilePath ~\Desktop\validation-verification.txt -Append
# "" | Out-File -FilePath ~\Desktop\validation-verification.txt -Append


Write-Host ""
Write-Host "Key Complete - Please Remove $SERIAL"