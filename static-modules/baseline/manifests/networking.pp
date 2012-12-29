# Basic neworking utilities
class baseline::networking {
  package{'wakeonlan':
    ensure  => present
  }

  package{'sshuttle':
    ensure  => present
  }

  file{"${home}/.ssh/config":
    source  => 'puppet:///modules/baseline/ssh_config'
  }
}
