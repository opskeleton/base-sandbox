group{ 'puppet': ensure  => present }

$username = hiera('user')
$scm_user = hiera('scm_user')
$scm_email = hiera('scm_email')
$home = hiera('home')

include backup::copy

node default {
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

if($environment == 'dev'){
  $globs='- /home/vagrant/.*
  - /home/vagrant/vim*'


  # backup jobs
  backup::duply {'sample':
    source      => '/home/vagrant/',
    target      => 'file://tmp/backup',
    globs       => $globs
  }

  backup::schedule {'sample': }

  backup::duply {'s3-ex':
    source      => '/home/vagrant/',
    target      => 's3+http://myUniqueBucketName',
    target_pass => 'foo',
    target_user => 'bla',
    globs       => $globs
  }

  backup::schedule {'s3-ex': }

  include backup::copy
}
