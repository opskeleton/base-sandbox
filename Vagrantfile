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

  %w(pythonized langs minimal backup virtualized logging zfs).each do |type|
    config.vm.define type.to_sym do |node| 
      node.vm.box = 'ubuntu-14.04_puppet-3.6.1'
      node.vm.hostname = "#{type}.local"

      node.vm.provider :virtualbox do |vb|
        vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 4]
      end

      node.vm.provision :shell, :inline => update
      node.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'manifests'
        puppet.manifest_file  = "#{type}.pp"
        puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment='dev'"
      end
    end

  end
end
