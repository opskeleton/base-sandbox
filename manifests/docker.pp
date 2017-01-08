node default {
  include docker
  include shell::fig
  docker::image {'redis:alpine':
    timeout => 360
  }
  docker::service{'redis:alpine':}

}


