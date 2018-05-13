node default {

  include kvm
  include virtualbox

  file{'/virtualbox':
     ensure => directory,
  }
  class{'virtualbox::manage':
    machinefolder => '/virtualbox',
    user          => 're-ops'
  }
  
  ufw::allow { 'ssh':
    port => '22'
  }
}


