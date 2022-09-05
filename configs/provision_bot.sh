#!/bin/sh

adduser -D admin
echo "admin:admin" | chpasswd
sudo su
echo -e "admin\tALL=NOPASSWD: ALL" >> /etc/sudoers

wget tinycorelinux.net/6.x/x86/tcz/inetutils-servers.tcz
sudo -u tc tce-load -i inetutils-servers.tcz

cd ~
mkdir telnet && cd telnet
wget http://mirrors.kernel.org/ubuntu/pool/universe/n/netkit-telnet/telnetd_0.17-40_i386.deb
ar x telnetd_0.17-40_i386.deb
tar xf data.tar.xz
mv ./usr/lib/telnetlogin /bin/
mv ./usr/sbin/in.telnetd /bin/telnetd
cd ~
rm -rf telnet

cat <<EOF > /usr/local/etc/inetd.conf
telnet stream tcp4 nowait root /bin/telnetd telnetd -L /bin/telnetlogin
EOF

sudo killall -9 inetd
sudo /usr/local/sbin/inetd
