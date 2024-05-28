$VBoxManagePath = "D:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

$vmName = "Fedora"

$isoPath = "C:\Users\Kamil\Desktop\Inne\Fedora-Server-netinst-x86_64-38-1.6.iso"

& "$VBoxManagePath" createvm --name $vmName --ostype "RedHat_64" --register

& "$VBoxManagePath" modifyvm $vmName --memory 2048 --acpi on --boot1 dvd --nic1 nat

& "$VBoxManagePath" createhd --filename "$vmName.vdi" --size 10000

& "$VBoxManagePath" storagectl $vmName --name "SATA Controller" --add sata

& "$VBoxManagePath" storageattach $vmName --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$vmName.vdi"

& "$VBoxManagePath" storageattach $vmName --storagectl "SATA Controller" --port 1 --device 0 --type dvddrive --medium $isoPath

& "$VBoxManagePath" startvm $vmName