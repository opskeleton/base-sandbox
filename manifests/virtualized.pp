node 'virtualized.local'{
  include vagrant
  include kvm
  include docker
  include shell::fig

  include virtualbox
  class{'virtualbox::manage':
    machinefolder => '/vagrant',
    user          => 'vagrant'
  }
}


