# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    (1..6).each do |i|
      config.vm.define "node#{i}" do |node|
        node.vm.hostname = "node#{i}"
  
        node.vm.box = "geerlingguy/centos7"
        node.vm.box_version = "1.2.19"
        
        node.vbguest.auto_update = false
        
        node.vm.network "private_network", ip: "192.168.17.#{27+i}"
        
        node.vm.provider "virtualbox" do |vb|
          vb.name = "node#{i}"
          vb.gui = false
          vb.memory = "512"
        end
  
        node.vm.provision "shell", path: "provision/bootstrap.sh", privileged: false
      end
    end
  end
    