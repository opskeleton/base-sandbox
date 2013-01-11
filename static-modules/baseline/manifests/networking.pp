# Basic neworking utilities
class baseline::networking {
  package{:
    ensure  => present
  }

  package{['sshuttle','wakeonlan','nmap']:
    ensure  => present
  }


  file{"${home}/.ssh/config":
    source  => 'puppet:///modules/baseline/ssh_config'
  }
}
