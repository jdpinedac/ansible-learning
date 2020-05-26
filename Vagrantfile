# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_IMAGE = "bento/centos-8.1"
NODE_COUNT = 2

Vagrant.configure("2") do |config|
  
  config.vm.box = BOX_IMAGE

  (1..NODE_COUNT).each do |i|
    config.vm.define "node#{i}" do |node|
      node.vm.hostname = "node#{i}.anslearn.lan"
      node.vm.network "private_network", ip: "192.168.50.10#{i}"
      node.vm.provision :shell, path: "bootstrap/bootstrap.sh", privileged: true
      node.vm.provider "virtualbox" do |v|
        v.name = "node#{i}"
      end
    end
  end
  
  config.vm.define "controller" do |ctrlr|
    ctrlr.vm.hostname = "ctrlr.anslearn.lan"
    ctrlr.ssh.username = "root"
    ctrlr.ssh.password = "vagrant"
    ctrlr.vm.network "private_network", ip: "192.168.50.2"
    ctrlr.vm.provision :shell, path: "bootstrap/bootstrap.sh", privileged: true
    ctrlr.vm.provider "virtualbox" do |v|
      v.name = "Controller"
    end
    ctrlr.vm.provision :ansible_local do |ansible|
      ansible.config_file       = "ansible.cfg"
      ansible.playbook          = "site.yml"
      ansible.inventory_path    = "inventory/hosts"
      ansible.limit             = "all"
      ansible.become            = true
      ansible.verbose           = "v"
    end
  end

end
