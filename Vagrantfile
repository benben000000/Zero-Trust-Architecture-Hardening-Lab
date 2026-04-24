# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  # -------------------------------------
  # Tier 0: Domain Controller (Windows)
  # -------------------------------------
  config.vm.define "dc01" do |dc01|
    dc01.vm.box = "peru/windows-server-2022-standard-x64-eval"
    dc01.vm.hostname = "DC01"
    dc01.vm.network "private_network", ip: "192.168.56.10"
    dc01.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus = 2
      vb.name = "ZT_DC01"
    end
  end

  # -------------------------------------
  # Tier 1: Linux Server (Ubuntu)
  # -------------------------------------
  config.vm.define "srv01" do |srv01|
    srv01.vm.box = "ubuntu/jammy64"
    srv01.vm.hostname = "srv01"
    srv01.vm.network "private_network", ip: "192.168.56.20"
    srv01.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
      vb.name = "ZT_SRV01"
    end
    # Provision with Ansible
    srv01.vm.provision "ansible" do |ansible|
      ansible.playbook = "Linux-Security/ansible/cis-baseline.yml"
    end
  end
end
