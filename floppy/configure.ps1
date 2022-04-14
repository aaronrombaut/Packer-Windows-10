# Switch network connection to Private mode
# Required for WinRM firewall rules
$profile = Get-NetConnectionProfile
Set-NetConnectionProfile -Name $profile.Name -NetworkCategory Private

#WinRM Configure
winrm quickconfig -quiet
winrm set winrm/config/service '@{AllowUnencrypted="true"}'
winrm set winrm/config/service/auth '@{Basic="true"}'

# Make a directory called C:\ImageBuild to install software
New-Item -Path "C:\" -Name "ImageBuild" -ItemType "directory" -Force