# Sets up netflix client for Linux (based on wine)
# see http://tinyurl.com/dxl4d28
class desktop::netflix {
  apt::ppa { 'ppa:ehoover/compholio': }

  package{'netflix-desktop':
    ensure  => present,
    require => Apt::Ppa['ppa:ehoover/compholio']
  }
}
