# -*- mode: ruby -*-
# vi: set ft=ruby :

update = <<SCRIPT
if [ ! -f /tmp/up ]; then
  sudo sed -i.bak s/us.archive/il.archive/g /etc/apt/sources.list
  sudo aptitude update 
  touch /tmp/up
fi
SCRIPT

update_bsd = <<SCRIPT
if [ ! -f /tmp/up ]; then
  pkg update -f
  pkg upgrade -y
  touch /tmp/up
fi
SCRIPT


Vagrant.configure("2") do |config|

  env  = ENV['PUPPET_ENV'] 
  env ||= 'dev'
  bridge = ENV['VAGRANT_BRIDGE']
  bridge ||= 'eth0'

  # Ubuntu instances
  %w(desktop pythonized langs minimal backup virtualized logging zfs example).each do |type|
    config.vm.define type.to_sym do |node| 
      node.vm.box = 'ubuntu-14.04.1_puppet-3.7.3'
      node.vm.hostname = "#{type}.local"

      node.vm.provider :virtualbox do |vb|
        vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 4]
      end

      node.vm.provision :shell, :inline => update
      node.vm.provision :puppet do |puppet|
        puppet.manifests_path = 'manifests'
        puppet.manifest_file  = "#{type}.pp"
        puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment=dev"
      end
    end
  end

  # BSD instances
  %w(syncbsd).each do |type|
    config.vm.define type.to_sym do |node|
      node.vm.box = 'trueos-10.1_puppet-3.6.2' 
      node.vm.guest = :freebsd
      node.vm.network :public_network, :bridge => bridge
      node.vm.network 'private_network', ip: '10.0.1.10'
      node.vm.hostname = "#{type}.local"

      node.vm.provider :virtualbox do |vb|
        vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
      end

      node.vm.synced_folder '.', '/vagrant', :nfs => true, id: 'vagrant-root'
      node.vm.provision :shell, :inline => update_bsd
      node.vm.provision :shell, inline: "cd /vagrant && ./bsdrun.sh manifests/#{type}.pp"
    end
  end

end
