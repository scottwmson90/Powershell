#Bypass execution policy
Set-ExecutionPolicy bypass -force

# Update these variables as needed
$InstallShare = '\\servername\folder\ExaClientViewerSETUP.exe'

# The sensor is copied to the following directory
$InstallLocal = 'C:\Temp\ExaClientViewerSETUP.exe'

# Create a TEMP directory if one does not already exist
if (!(Test-Path -Path 'C:\Temp' -ErrorAction SilentlyContinue)) {

    New-Item -ItemType Directory -Path 'C:\Temp' -Force

}
# Now copy the installer if the share is available
if (Test-Path -Path $InstallShare) {

    Copy-Item -Path $InstallShare -Destination $InstallLocal -Force

}
# Install EXA
Start-Process -FilePath $installLocal -argumentList "/install /silent /norestart" -wait
