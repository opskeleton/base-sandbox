# -*- mode: ruby -*-
# vi: set ft=ruby :

UPDATE_BSD = <<SCRIPT
if [ ! -f /tmp/up ]; then
  FETCH_TIMEOUT=200  pkg update -f
  touch /tmp/up
fi
SCRIPT

BSD = %w(manifests/minimal_bsd.pp)
LINUX = Dir['manifests/*'] - BSD

def profile(type)
  "--test --evaltrace --logdest=/vagrant/#{type}.log" 
end

Vagrant.configure("2") do |config|
  # Ubuntu instances
  LINUX.map{|it| it.match(/manifests\/(\w*).pp/)[1]}.each do |type|
    config.vm.define type.to_sym do |node|
    	env  = ENV['PUPPET_ENV'] || 'dev'
	node.vm.box = 'ubuntu-16.04.2_puppet-3.8.7'
      node.vm.hostname = "#{type}.local"
      node.vm.provision :puppet do |puppet|
         puppet.manifests_path = 'manifests'
         puppet.manifest_file  = "#{type}.pp"
         puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment=#{env} "
     end
    end
  end

  BSD.map{|it| it.match(/manifests\/(\w*).pp/)[1]}.each do |type|
    config.vm.define type.to_sym do |node|
	node.ssh.shell = '/bin/sh'
	node.vm.network :public_network, :bridge => ENV['VAGRANT_BRIDGE'] || 'eth0'
	node.vm.provider 'virtualbox'
	node.vm.box = 'FreeBSD-11-zfs'
      node.vm.guest = :freebsd
      node.vm.network 'private_network', ip: '10.0.1.10'

      node.vm.synced_folder ".", "/vagrant", type: "nfs" # or "rsync"

      node.vm.provider :virtualbox do |vb|
        vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
      end

      node.vm.provision :shell, :inline => UPDATE_BSD
      node.vm.provision :shell, inline: "cd /vagrant && ./bsdrun.sh manifests/#{type}.pp"
    end
  end
end
