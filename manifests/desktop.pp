node default {

  include apt

  if $operatingsystem == 'Ubuntu' {
    package{'software-properties-common':
      ensure  => present
    } -> Exec <||>

    Service {
      provider => systemd
    }
  }

  class{'desktop::misc':
    scanner => '1.2.3.4'
  }

  class{'desktop::x2go':
    server => true,
    lan    => '10.0.2.2'
  }
}

