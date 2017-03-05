# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.define "DomainController1" do |dc01|
    #dc01.vm.box = "jptoto/Windows2012R2"
    dc01.vm.hostname = "DC01"
    dc01.vm.box = "mwrock/Windows2012R2"
    dc01.vm.communicator = "winrm"
    dc01.winrm.username = "vagrant"
    dc01.winrm.password = "vagrant"
    dc01.vm.network "private_network", ip: "192.168.10.2"
    dc01.vm.provision "shell", path: "ps1/Setup-CommonTools.ps1"
    dc01.vm.provision "shell", path: "ps1/Install-DC.ps1"
    dc01.vm.provision "shell", path: "ps1/Setup-DC.ps1"
    dc01.vm.provider "VirtualBox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      #vb.customize ["modifyvm", :id, "--boot1", "disk", "--boot2", "dvd"]
      vb.storage :file, :device => :cdrom, :bus => :ide, :type => :raw, :path => "C:\\vm\\Server2kR2.ISO"

    end
  end

  config.vm.define "DSCServer" do |dsc|
    #dsc.vm.box = "jptoto/Windows2012R2"
    dsc.vm.box = "mwrock/Windows2012R2"
    dsc.vm.hostname = "DSC"
    dsc.vm.communicator = "winrm"
    dsc.winrm.username = "vagrant"
    dsc.winrm.password = "vagrant"
    dsc.vm.network "private_network", ip: "192.168.10.3"
    dsc.vm.provision "shell", path: "ps1/Setup-CommonTools.ps1"
    dsc.vm.provider "VirtualBox" do |vb|
      vb.memory = 2048
      vb.cpus = 2
      vb.customize ["modifyvm", :id, "--boot1", "disk", "--boot2", "dvd"]
    end
  end


end
