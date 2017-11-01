node default {
  include docker

  docker::image {'redis:alpine': }

  class {'docker::compose':
    ensure => present,
  }

}


