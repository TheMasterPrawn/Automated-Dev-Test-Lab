# Require the reboot plugin.
Vagrant.configure("2") do |config|
  config.vm.box = "cdaf/WindowsServerStandard"
  config.vm.provider "hyperv" 
  config.vm.define "windows-domain-controller-hyperv"
  #config.vm.hostname = "dc01"
  # vagrant box add hashicorp/precise64 --provider hyperv 
  config.vm.guest = :windows
  config.vm.communicator = "winrm"
  config.vm.boot_timeout = 1200 # 20 minutes
  config.winrm.timeout = 1800 # 30 minutes
  config.winrm.max_tries = 20
  config.winrm.retry_limit = 200
  config.winrm.retry_delay = 10
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"
  config.vm.graceful_halt_timeout = 600
  
  unless Vagrant.has_plugin?("vagrant-reload")
    puts 'Installing vagrant-reload Plugin...'
    system('vagrant plugin install vagrant-reload')
  end
  # .box images available from https://app.vagrantup.com/cdaf

  # use the plaintext WinRM transport and force it to use basic authentication.
  # NB this is needed because the default negotiate transport stops working
  #    after the domain controller is installed.
  #    see https://groups.google.com/forum/#!topic/vagrant-up/sZantuCM0q4
  config.winrm.transport = :plaintext
  config.winrm.basic_auth_only = true
  config.vm.boot_timeout = 1200

  config.vm.provider :virtualbox do |v, override|
      v.linked_clone = true
      v.cpus = 2
      v.memory = 4096
      #v.customize ["modifyvm", :id, "--vram", 64]
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  config.vm.provider "hyperv" do |h, override|
    override.vm.synced_folder ".", "/vagrant", disabled: true
    h.linked_clone = true
    h.cpus = 2
    h.memory = 4096
    h.enable_virtualization_extensions = true
    #h.differencing_disk = true
    config.vm.network "public_network", bridge: "vswitch" #add vswitch in hyperv manager
  end 

  #config.vm.network "private_network", ip: "192.168.3.2", libvirt__forward_mode: "route", libvirt__dhcp_enabled: false
  config.vm.provision "file", source: "ad_data", destination: "/tmp/ad_data" #copy ad data into the vm
  #config.vm.synced_folder "ad_data", "/tmp/ad_data", type: "smb", mount_options: ["username=vagrant","password=vagrant"]

  config.vm.provision "shell", path: "ps1/Setup-CommonTools.ps1" #install tooling and set locale
  config.vm.provision :reload

  config.vm.provision "shell", path: "ps1/Setup-DC.ps1" #install role
  config.vm.provision :reload

  config.vm.provision "shell", path: "ps1/Configure-DC.ps1" #add vagrant to admins
  config.vm.provision :reload

  config.vm.provision "shell", path: "ps1/Create-OUs.ps1" #creates a users and a groups OU
  config.vm.provision "shell", path: "Create-ADUser.ps1" #creates the users fom the file
  config.vm.provision "shell", path: "Create-GroupFromDept.ps1" #creates groups based on the unique departments
  config.vm.provision "shell", path: "Add-ADUserToGroup.ps1" #adds the users to the group based on their department
  config.vm.provision "shell", path: "ps1/Set-DepartmentManager.ps1" #give groups and users a randomly selected manager
end
