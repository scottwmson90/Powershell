#Bypass execution policy
Set-ExecutionPolicy bypass -force

#The following script enables Bitlocker Encryption with Recovery Password backed up to AD.
Enable-Bitlocker -MountPoint c: -UsedSpaceOnly -SkipHardwareTest -TpmProtector -Confirm
