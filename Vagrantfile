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
    #dc01.vm.provision "shell", path: "ps1/Install-DC.ps1"
    #dc01.vm.provision "shell", path: "ps1/Setup-DC.ps1"
    dc01.vm.provider "VirtualBox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
      vb.customize ["storageattach ", :id, "--storagectl ", "IDE", "--port", "0", "--device", "1", "--type", "dvddrive", "--medium", "C:\\vm\\Server2kR2.ISO"]
      # Virtual box settings, does not work on windows, needs work.
      # VBoxManage.exe storagectl "domain_DomainController1_1488791279194_72311" --name IDE --add ide
      # VBoxManage.exe storageattach "domain_DomainController1_1488791279194_72311" --storagectl IDE --port 0 --device 1 --type dvddrive --medium "C:\vm"
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
      vb.memory = 1024
      vb.cpus = 2
    end
  end

  config.vm.define "webserver01" do |web01|
    web01.vm.box = "mwrock/Windows2012R2"
    web01.vm.hostname = "windows-webserver01"
    web01.vm.communicator = "winrm"
    web01.winrm.username = "vagrant"
    web01.winrm.password = "vagrant"
    web01.vm.network "private_network", ip: "192.168.10.4"
    web01.vm.provider "VirtualBox" do |vb|
      vb.memory = 1024
      vb.cpus = 2
    end
  end

end
