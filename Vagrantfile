# -*- mode: ruby -*-
# vi: set ft=ruby :

MIRROR=ENV['MIRROR'] || 'us.archive.ubuntu.com'

update = <<SCRIPT
if [ ! -f /tmp/up ]; then
  sudo sed -i.bak "s/us.archive.ubuntu.com/#{MIRROR}/g" /etc/apt/sources.list
  sudo sed -i.bak '/deb-src/d' /etc/apt/sources.list
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

  device = ENV['VAGRANT_BRIDGE'] || 'eth0'
  pool = ENV['VAGRANT_POOL'] 

  # Ubuntu instances
  Dir['manifests/*'].map{|it| it.match(/manifests\/(\w*).pp/)[1]}.each do |type|
    config.vm.define type.to_sym do |node| 
      node.vm.box = 'ubuntu-15.10_puppet-3.8.2'
      # node.vm.hostname = "#{type}.local"
	node.vm.provider 'libvirt'

      node.vm.provider :virtualbox do |vb, o|
        vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 4]
	  o.vm.network :public_network, :bridge => device , :dev => device
      end

      node.vm.provider :libvirt do |domain, o|
        domain.uri = 'qemu+unix:///system'
        domain.host = "#{type}.local"
        domain.memory = 2048
        domain.cpus = 2
        domain.storage_pool_name = pool if pool
        o.vm.synced_folder './', '/vagrant', type: '9p'
      end

	node.vm.provision :shell, inline: "hostnamectl set-hostname #{type}.local"
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
      node.vm.network :public_network, :bridge => device
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
