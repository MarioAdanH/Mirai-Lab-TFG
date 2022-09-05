@ECHO OFF
ECHO Actualizando y compilando cambios en Mirai

vagrant ssh mirai -c "sudo /vagrant/configs/recompilar.sh"
PAUSE
