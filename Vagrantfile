# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
    config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  else
    config.vm.synced_folder ".", "/vagrant"
  end  
  (1..2).each do |i|
    config.vm.define "lb-#{i}" do |d|
      d.vm.box = "ubuntu/trusty64"
      d.vm.hostname = "lb-#{i}"
      x = 0
    #  d.vm.network "public_network", bridge: "eno4", ip: "192.168.57.10#{i+x}", auto_config: "false", netmask: "255.255.255.0" , gateway: "192.168.57.1"
    #  d.vm.provision :shell, inline: " sudo route delete default; sudo route add default gw 192.168.57.1 dev enp0s8 "       
       d.vm.network "private_network", ip: "192.168.56.10#{i+x}"    
      d.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus=2  
      end
      if (i == 1)
#         d.vm.provision :shell, path: "scripts/bootstrap4CentOs_ansible.sh"

      end 
     d.vm.provision :shell, inline: " sudo apt-get update && apt-get install keepalived  -y  " 
    end
  end  
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
    config.vbguest.no_install = false
    config.vbguest.no_remote = false
  end
end
