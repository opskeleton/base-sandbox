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
	env  = ENV['PUPPET_ENV'] || 'dev'
	node.vm.box = 'ubuntu-16.04_puppet-3.8.7'
	node.vm.hostname = "#{type}.local"
	node.vm.provision :puppet do |puppet|
	  puppet.manifests_path = 'manifests'
	  puppet.manifest_file  = "#{type}.pp"
	  puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment=#{env}"
	end
    end
  end

end
