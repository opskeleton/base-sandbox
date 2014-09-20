node 'virtualized.local'{
  include vagrant
  include virtualbox
  include kvm
  include docker
  include shell::fig
}


