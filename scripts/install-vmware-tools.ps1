# Tha path to the VMware Tools ISO
$imagePath = "C:\ImageBuild\01 - VMware Tools\windows.iso"

# Mount the ISO
Mount-DiskImage -ImagePath $imagePath

# Get the drive letter the ISO is mounted to
$driveLetter = (Get-DiskImage -DevicePath \\.\CDROM1 | Get-Volume).DriveLetter

# Create an installer path variable
$filePath = $driveLetter+":\setup64.exe"
# Create an installer arguments variable
$arguments = '/S /v "/qn /l*v "C:\ImageBuild\01 - VMware Tools\vmmsi.log" REBOOT=R ADDLOCAL=ALL'

# Install VMware Tools
Start-Process -FilePath $filePath -ArgumentList $arguments