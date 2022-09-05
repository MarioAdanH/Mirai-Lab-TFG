# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.define "mirai" do |mirai|
      mirai.vm.box = "ubuntu/xenial64"
      mirai.vm.network "public_network", bridge: "Realtek PCIe 2.5GbE Family Controller", ip: "192.168.1.11"
      mirai.vm.provision "shell", path: "configs/provision.sh"
      mirai.vm.hostname = "mirai"

      mirai.vm.provider "virtualbox" do |vb|
        vb.name = "mirai"
        vb.memory = "2048"
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--uartmode1", "disconnected"]
      end
    end

    (1..10).each do |i|
      config.vm.define "bot_#{i}" do |bot|
        bot.vm.network "public_network", bridge: "Realtek PCIe 2.5GbE Family Controller", ip: "192.168.1.#{100+i}"
        bot.vm.box = "yhmr/tinycore-8"
        bot.vm.box_check_update = false
        bot.ssh.shell = "sh"
	bot.ssh.insert_key = false  
        bot.vm.synced_folder './', '/vagrant', disabled: true
        bot.vm.hostname = "bot-#{i}"
        bot.vm.provision "shell", :run => 'always', path: "configs/provision_bot.sh"
        
        bot.vm.provider "virtualbox" do |vb|
          vb.name = "bot_#{i}"
          vb.memory = "256"
          vb.cpus = 1
        end
      end
    end

end