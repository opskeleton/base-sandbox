# -*- mode: ruby -*-
# vi: set ft=ruby :

update = <<SCRIPT
if [ ! -f /tmp/up ]; then
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

  env  = ENV['PUPPET_ENV'] || 'dev'
  device = ENV['VAGRANT_BRIDGE'] || 'eth0'

  # Ubuntu instances
  Dir['manifests/*'].map{|it| it.match(/manifests\/(\w*).pp/)[1]}.each do |type|
    config.vm.define type.to_sym do |node| 
	node.vm.box = 'ubuntu-15.04_puppet-3.8.2'
	node.vm.hostname = "#{type}.local"
	node.vm.network :public_network, :bridge => device , :dev => device

	node.vm.provider :virtualbox do |vb|
	  vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 4]
	end

	node.vm.provider :libvirt do |domain, o|
	  domain.uri = 'qemu+unix:///system'
	  domain.host = "#{type}.local"
	  domain.memory = 2048
	  domain.cpus = 2
	  domain.storage_pool_name = 'daemon'
	  o.vm.synced_folder './', '/vagrant', type: 'nfs'
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
