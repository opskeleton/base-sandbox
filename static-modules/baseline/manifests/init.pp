# baseline tools and package for a working secured system.
class baseline {
  include security
  include networking

  package{'mercurial': ensure  => present }
}
