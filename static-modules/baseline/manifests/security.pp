# Security tools
class security {
  package{'pwgen':
    ensure => present
  }

  package{['encfs', 'sshfs']:
    ensure => present
  }
}
