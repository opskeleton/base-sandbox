group{ 'puppet': ensure  => present }

$username = hiera('user')
$scm_user = hiera('scm_user')
$scm_email = hiera('scm_email')
$home = hiera('home')

node 'puppet-base-env.local' {

  import 'backups.pp'
  include git
  include shell
  include baseline
  include langs
  include vim
  include build
  include barbecue
  include vagrant
  class {'desktop':
    home     => $home,
    username => $username
  }

}
