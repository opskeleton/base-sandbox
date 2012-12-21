#  Sets up glances (https://github.com/nicolargo/glances)
class glances {

  package{['python-pip', 'build-essential', 'python-dev']:
    ensure  => present
  }

  # Enabling more info
  package{'lm-sensors':
    ensure  => present
  }

  package{'glances':
    ensure   => present,
    provider => pip,
    require  => Package['python-pip', 'build-essential', 'python-dev']
  }
}
