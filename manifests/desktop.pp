node default {

  include apt
  include git

  class {'desktop':
    cleanup => true
  }

  if $operatingsystem == 'Ubuntu' {
    package{'software-properties-common':
      ensure  => present
    } -> Exec <||>

    Service {
      provider => systemd
    }
  }


}

