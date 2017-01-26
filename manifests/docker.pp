node default {
  include docker
  docker::image {'redis:alpine':
    timeout => 360
  }
  docker::service{'redis:alpine':}

}


