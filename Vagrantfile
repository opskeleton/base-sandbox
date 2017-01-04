# -*- mode: ruby -*-
# vi: set ft=ruby :

UPDATE_BSD = <<SCRIPT
if [ ! -f /tmp/up ]; then
  pkg update -f
  touch /tmp/up
fi
SCRIPT

BSD = %w(manifests/minimal_bsd.pp)
LINUX = Dir['manifests/*'] - BSD

Vagrant.configure("2") do |config|
  # Ubuntu instances
  LINUX.map{|it| it.match(/manifests\/(\w*).pp/)[1]}.each do |type|
    config.vm.define type.to_sym do |node|
	node.vm.box = 'ubuntu-16.04_puppet-3.8.7'
      node.vm.hostname = "#{type}.local"
    end
  end

  BSD.map{|it| it.match(/manifests\/(\w*).pp/)[1]}.each do |type|

    device = ENV['VAGRANT_BRIDGE'] || 'eth0'
    config.vm.define type.to_sym do |node|
	node.ssh.shell = '/bin/sh'
	node.vm.network :public_network, :bridge => device,  auto_config: false
	node.vm.provider 'virtualbox'
	node.vm.box = 'freebsd-10.2_puppet-3.8.2'
      node.vm.guest = :freebsd
      node.vm.network 'private_network', ip: '10.0.1.10'

      node.vm.provider :virtualbox do |vb|
        vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
      end

      node.vm.synced_folder '.', '/vagrant', type: :nfs
      node.vm.provision :shell, :inline => UPDATE_BSD
      node.vm.provision :shell, inline: "cd /vagrant && ./bsdrun.sh manifests/#{type}.pp"
    end
  end

end
