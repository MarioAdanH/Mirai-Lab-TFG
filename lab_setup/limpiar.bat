@ECHO OFF
ECHO Deleting VM and vagrant data...

RMDIR /S /Q E:\vbox
RMDIR /S /Q C:\Users\Mario\.vagrant.d
RMDIR /S /Q C:\Users\Mario\.VirtualBox

ECHO Reseting network adapter...

netsh int ipv4 set addr "Realtek PCIe 2.5GbE Family Controller" source=dhcp
netsh int ipv4 set dns "Realtek PCIe 2.5GbE Family Controller" source=dhcp
netsh int set int "Realtek PCIe 2.5GbE Family Controller" admin=disabled
