# -*- mode: ruby -*-
# vi: set ft=ruby :

update = <<SCRIPT
if [ ! -f /tmp/up ]; then
  sudo sed -i.bak s/us.archive/il.archive/g /etc/apt/sources.list
  sudo aptitude update 
  touch /tmp/up
fi
SCRIPT

Vagrant.configure("2") do |config|

  config.vm.define :minimal do |minimal| 
    minimal.vm.box = 'ubuntu-14.04_puppet-3.6.1'
    minimal.vm.hostname = 'minimal.local'

    minimal.vm.network :private_network, ip: "192.168.1.25"
    minimal.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 4]
    end

    minimal.vm.provision :shell, :inline => update
    minimal.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "default.pp"
      puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment='dev'"
    end
  end

  config.vm.define :backup do |backup| 
    backup.vm.box = 'ubuntu-14.04_puppet-3.6.1'
    backup.vm.hostname = 'backup.local'

    backup.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 4]
    end

    backup.vm.provision :shell, :inline => update
    backup.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "default.pp"
      puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment='dev'"
    end
  end

  config.vm.define :virtualized do |virtualized| 
    virtualized.vm.box = 'ubuntu-14.04_puppet-3.6.1'
    virtualized.vm.hostname = 'virtualized.local'

    virtualized.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 4]
    end

    virtualized.vm.provision :shell, :inline => update
    virtualized.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "default.pp"
      puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment='dev'"
    end
  end



end
