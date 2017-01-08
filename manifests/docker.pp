node default {
  include docker
  include shell::fig
  docker::image {'library/redis':
    timeout => 360
  }
  docker::service{'library/redis':}

}


