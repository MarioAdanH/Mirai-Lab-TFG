@ECHO OFF
ECHO Iniciando mirai cnc y loader...

vagrant ssh mirai -c "sudo /vagrant/configs/start.sh"
PAUSE
