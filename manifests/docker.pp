node default {
  package{'linux-image-extra-virtual':
    ensure  => present
  }

  -> class{'docker':
    manage_kernel => false
  }

  docker::image {'redis:alpine': }

  class {'docker::compose':
    ensure => present,
  }

}


