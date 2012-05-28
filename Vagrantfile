# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "ubuntu-11.10"

  config.vm.network :bridged

  config.vm.provision :puppet, :module_path => "modules" 

  config.vm.customize ["modifyvm", :id, "--memory", 2096 , "--cpus", 2]

  config.vm.host_name = 'puppet-base-env'
end
