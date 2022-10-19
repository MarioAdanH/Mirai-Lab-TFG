@ECHO OFF
ECHO Generando debug

vagrant ssh mirai -c "/vagrant/configs/debuger.sh"
PAUSE
