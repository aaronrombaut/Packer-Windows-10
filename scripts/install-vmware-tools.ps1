$imagePath = "C:\ImageBuild\01 - VMware Tools\windows.iso"
Mount-DiskImage -ImagePath $imagePath
$driveLetter = (Get-DiskImage -DevicePath \\.\CDROM1 | Get-Volume).DriveLetter
$filePath = $driveLetter+":\setup64.exe"
$arguments = '/S /v "/qn /l*v "C:\ImageBuild\01 - VMware Tools\vmmsi.log" REBOOT=R ADDLOCAL=ALL'
Start-Process -FilePath $filePath -ArgumentList $arguments