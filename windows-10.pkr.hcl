source "vmware-iso" "windows-10" {
  guest_os_type = "windows9-64"
  version = 19
  cdrom_adapter_type = "sata"
  disk_adapter_type = "nvme"
  vmx_data = {"firmware" = "efi", "uefi.secureBoot.enabled" = "TRUE"}
  boot_wait = "3s"
  boot_command = [
    "<space>"
    ]

  // Driver Configuration
  fusion_app_path = "/Applications/VMware Fusion.app"

  // ISO Configuration
  iso_url = "iso/Windows-10-21H2.iso"
  iso_checksum = "sha256:2fd924bf87b94d2c4e9f94d39a57721af9d986503f63d825e98cee1f06c34f68"
  
  // Shutdown Configuration
  shutdown_command = "shutdown /s /t 3600"

  // Communicator Configuration
  communicator = "winrm"
  winrm_username = "WinRM.adm"
  winrm_password = "VMware1!VMware1!"
  winrm_use_ssl = "false"
  winrm_port = 5985
  winrm_timeout = "10m"

  // Hardware Configuration
  cpus = 2
  memory = 2048
//  network = "bridged"
//  network_adapter_type = "VMXNET3"
//  network_name = "Wi-Fi"

  // Floppy Configuration
  floppy_files = ["floppy/Autounattend.xml", "floppy/pvscsi", "floppy/configure.ps1"]

  // VMware Tools
  tools_upload_flavor = "windows"
  tools_source_path = "software/01 - VMware Tools/windows.iso"
  tools_upload_path = "C:/ImageBuild/01 - VMware Tools/windows.iso"

  http_directory = "software/01 - VMware Tools/windows.iso"
}


build {
  sources = ["sources.vmware-iso.windows-10"]

  provisioner "powershell" {
    elevated_user = "Administrator"
    elevated_password = "VMware1!"
    scripts = ["scripts/install-vmware-tools.ps1"]
  }
}
