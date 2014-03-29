# -*- mode: ruby -*-
# vi: set ft=ruby :

update = <<SCRIPT
if [ ! -f /tmp/up ]; then
  sudo aptitude update 
  touch /tmp/up
fi
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = 'ubuntu-13.10_puppet-3.4.3'
  config.vm.hostname = 'puppet-base-env.local'
  # config.cache.auto_detect = true
  
  config.vm.network :public_network , { bridge: 'eth0' }
  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 4]
  end

  config.vm.provision :shell, :inline => update
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "default.pp"
    puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment='dev'"
  end
end
