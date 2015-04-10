node default {
  include vagrant
  include vagrant::libvirt

  include kvm
  include docker
  include shell::fig

  include virtualbox

  class{'virtualbox::manage':
    machinefolder => '/vagrant',
    user          => 'vagrant'
  }
}


