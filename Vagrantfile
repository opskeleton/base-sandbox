# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = 'ubuntu-12.10_puppet-3'
  config.vm.network :bridged
  config.vm.customize ["modifyvm", :id, "--memory", 2048, "--cpus", 4]
  config.vm.host_name = 'puppet-base-env'
end
