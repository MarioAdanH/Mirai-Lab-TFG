@ECHO OFF
ECHO Si alguno de los enlaces ya no es valido, dirigete a la pagina oficial.
ECHO Descargando Vagrant y VirtualBox...


curl https://releases.hashicorp.com/vagrant/2.2.9/vagrant_2.2.9_x86_64.msi -O vagrant_2.2.9_x86_64.msi
curl https://download.virtualbox.org/virtualbox/6.1.36/VirtualBox-6.1.36-152435-Win.exe -O VirtualBox-6.1.36-152435-Win.exe

vagrant_2.2.9_x86_64.msi
VirtualBox-6.1.36-152435-Win.exe
