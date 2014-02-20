#!/usr/bin/env ruby
#^syntax detection

# -*- mode: ruby -*-
# vi: set ft=ruby :

#
#
#
VAGRANTFILE_API_VERSION = "2"
Vagrant.require_version ">= 1.4.3"  

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network :private_network, ip: "192.168.33.200"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  #
  # Virtual machine for proxysql
  #
  config.vm.define "proxysql", primary: true do |proxysql|
    
    proxysql.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = ["Chef/cookbooks", "Chef/local"]
      chef.roles_path = "Chef/roles"
      chef.add_role "base"
      chef.add_role "proxysql"
    end
  end
  
end
