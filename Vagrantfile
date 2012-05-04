# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "ubuntu-11.10"

  config.vm.network :bridged

  # config.vm.forward_port 5984, 5983

  config.vm.provision :puppet, :module_path => "modules" 

  config.vm.customize ["modifyvm", :id, "--memory", 2096 , "--cpus", 2]
end
