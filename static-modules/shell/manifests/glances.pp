#  Sets up glances (https://github.com/nicolargo/glances)
class shell::glances {

  package{['python-pip', 'build-essential', 'python-dev']:
    ensure  => present
  }

  # Enabling more info
  package{'lm-sensors':
    ensure  => present
  }

  package{'glances':
    ensure   => installed,
    provider => pip,
    require  => Package['python-pip', 'build-essential', 'python-dev'],
  }
}
