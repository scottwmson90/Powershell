#Bypass execution policy
Set-ExecutionPolicy bypass -force

# Remove Citrix Receiver

Start-Process -FilePath 'C:\ProgramData\Citrix\Citrix Receiver 4.12\ReceiverCleanupUtility.exe' -ArgumentList "/silent" -wait

Start-Process -FilePath 'C:\Program Files (x86)\Citrix\Citrix Workspace *\ReceiverCleanupUtility.exe' -ArgumentList "/silent" -wait

Start-Process -FilePath 'C:\Users\*\AppData\Local\Citrix\Citrix Receiver 4.12\ReceiverCleanupUtility.exe' -ArgumentList "/silent" -wait




#Wait for uninstall to finish
Start-Sleep -Second 0



# Update these variables as needed
$InstallShare = '\\servername\folder\CitrixWorkspaceApp.exe'

# The sensor is copied to the following directory
$InstallLocal = 'C:\Temp\CitrixWorkspaceApp.exe'

# Create a TEMP directory if one does not already exist
if (!(Test-Path -Path 'C:\Temp' -ErrorAction SilentlyContinue)) {

    New-Item -ItemType Directory -Path 'C:\Temp' -Force

}
# Now copy the sensor installer if the share is available
if (Test-Path -Path $InstallShare) {

    Copy-Item -Path $InstallShare -Destination $InstallLocal -Force

}
# Install Citrix Workspace LTSR
Start-Process -FilePath $installLocal -argumentList "/install /silent /norestart" -wait
