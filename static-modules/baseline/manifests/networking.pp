# Basic neworking utilities
class baseline::networking {

  package{['sshuttle','wakeonlan','nmap']:
    ensure  => present
  }

  file{"${::home}/.ssh":
    ensure => directory,
  }

  file{"${::home}/.ssh/config":
    source  => 'puppet:///modules/baseline/ssh_config',
    require => File["${::home}/.ssh"]
  }
}
