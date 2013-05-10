group{ 'puppet': ensure  => present }

$username = hiera('user')
$scm_user = hiera('scm_user')
$scm_email = hiera('scm_email')
$home = hiera('home')

class { 'apt':
  always_apt_update    => false,
  disable_keys         => undef,
  proxy_host           => false,
  proxy_port           => '8080',
  purge_sources_list   => false,
  purge_sources_list_d => false,
  purge_preferences_d  => false
}

include git
include shell
include baseline
include langs
include vim
include build
class {'desktop':
  home     => $home,
  username => $username
}


import 'backups.pp'
