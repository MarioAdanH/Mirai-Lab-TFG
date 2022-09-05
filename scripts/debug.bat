@ECHO OFF
ECHO Generando debug

vagrant ssh mirai -c "sudo /vagrant/configs/debuger.sh"
PAUSE
