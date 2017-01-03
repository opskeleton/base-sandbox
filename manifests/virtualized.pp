node default {
  include vagrant
  include vagrant::libvirt

  include kvm

  include virtualbox

  class{'virtualbox::manage':
    machinefolder => '/vagrant',
    user          => 'vagrant'
  }
  
  ufw::allow { 'ssh':
    port => '22'
  }
}


