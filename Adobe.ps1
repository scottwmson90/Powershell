#Bypass execution policy
Set-ExecutionPolicy bypass -force

# Update these variables as needed
$InstallShare = '\\servername\folder\folder'

# The sensor is copied to the following directory
$InstallLocal = 'C:\Temp\folder'

# Create a TEMP directory if one does not already exist
if (!(Test-Path -Path 'C:\Temp' -ErrorAction SilentlyContinue)) {

    New-Item -ItemType Directory -Path 'C:\Temp\' -Force

}
# Now copy the installer if the share is available
if (Test-Path -Path $InstallShare) {

    Copy-Item -Path $InstallShare -Destination $InstallLocal -Recurse -Force 

    -Wait

}



# Install Adobe
Start-Process msiexec.exe -Wait -ArgumentList '/I C:\Temp\Adobe_Acrobat\AcroPro.msi /quiet /norestart'
