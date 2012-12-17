# vagrant box seems to miss this group
group{ 'puppet': ensure  => present }

# when not used within vagrant context this should be set to the main user
$username = 'ronen'
$scm_user = 'narkisr'
$scm_email = 'narkisr@gmail.com'
$home = "/home/${username}"


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
include vim
include langs
include build
class {'desktop':
  home     => $home,
  username => $username
}
include chrome
