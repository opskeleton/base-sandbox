# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = 'ubuntu-13.04_puppet-3.1'
  config.vm.box_url='http://ubuntuone.com/6DnhpowFnqDbJEgwqqDiud'
  config.vm.hostname = 'puppet-base-env.local'
  config.cache.auto_detect = true
  
  config.vm.network :public_network, { bridge: 'eth0' }
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 4]
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "default.pp"
    puppet.options = '--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml'
  end


end
