# Basic neworking utilities
class baseline::networking {

  $home = hiera('home')

  package{['sshuttle','wakeonlan','nmap']:
    ensure  => present
  }

  file{"${home}/.ssh/config":
    source  => 'puppet:///modules/baseline/ssh_config'
  }
}
