# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_IMAGE = "bento/centos-8.1"
NODE_COUNT = 2

Vagrant.configure("2") do |config|

  config.vm.define "controller" do |subconfig|
    subconfig.vm.box = BOX_IMAGE
    subconfig.vm.hostname = "ctrlr.anslearn.lan"
    config.vm.network "private_network", ip: "192.168.50.2"
  end

  (1..NODE_COUNT).each do |i|
    config.vm.define "node#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.hostname = "node#{i}.anslearn.lan"
      config.vm.network "private_network", ip: "192.168.50.10#{i}"
    end
  end
end
