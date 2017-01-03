node default {
  include docker
  include shell::fig
  docker::image {'library/redis':}
  docker::service{'library/redis':}

}


