# Security tools
class baseline::security {
  package{'pwgen':
    ensure => present
  }

  package{['encfs', 'sshfs']:
    ensure => present
  }
}
