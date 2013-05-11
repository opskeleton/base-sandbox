group{ 'puppet': ensure  => present }

$username = hiera('user')
$scm_user = hiera('scm_user')
$scm_email = hiera('scm_email')
$home = hiera('home')

node 'puppet-base-env.local' {

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

}
