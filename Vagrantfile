# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Cấu hình máy chủ master
  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/bionic64"
    master.vm.network "private_network", ip: "192.168.56.30"
    master.vm.provision "shell", path: "setup-master.sh"
  end

  # Cấu hình máy chủ backup
  config.vm.define "backup" do |backup|
    backup.vm.box = "ubuntu/bionic64"
    backup.vm.network "private_network", ip: "192.168.56.31"
    backup.vm.provision "shell", path: "setup-backup.sh"
  end
end
