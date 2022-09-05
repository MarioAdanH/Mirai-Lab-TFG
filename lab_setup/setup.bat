@ECHO OFF
ECHO SSD (E:) for VMs

REM En caso de querer cambiar la carpeta de almacenamiento de las maquinas, se debe comprobar si el archivo VBoxManage se encuentra en la carpeta donde se ha instalado Vbox.
MD E:\vbox
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" setproperty machinefolder "E:\vbox"

REM Cambiar adaptador de red

ECHO Configurando Realtek PCIe 2.5GbE Family Controller...

netsh int set int "Realtek PCIe 2.5GbE Family Controller" admin=enabled
netsh int ipv4 set addr "Realtek PCIe 2.5GbE Family Controller" static addr=192.168.1.10/24
netsh int ipv4 set dns "Realtek PCIe 2.5GbE Family Controller" static 192.168.1.11 validate=no