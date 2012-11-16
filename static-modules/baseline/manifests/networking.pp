# Basic neworking utilities
class baseline::networking {
  package{'wakeonlan':
    ensure  => present
  }
}
