group{ 'puppet': ensure  => present }

$username = hiera('user')
$scm_user = hiera('scm_user')
$scm_email = hiera('scm_email')
$home = hiera('home')

node default {
  include git
  include shell
  include baseline
  include langs
  include vim
  include build
  include barbecue
  include barbecue::packages
  include vagrant
  include docker
  include virtualbox
  include kvm

  class {'ssmtp':
    email => 'foo@gmail.com',
    host  => 'smtp.gmail.com:587',
    user  => 'foo',
    pass  => 'bar'
  }

  class {'desktop':
    home     => $home,
    username => $username
  }


}

if($environment == 'dev'){

  include clamav
  clamav::scan { 'all-but-sys-and-dev':
    exclude_dir => ['(?i)/^\/(sys|dev)/'],
    scan        => ['/'],
    enable      => true,
  }

  $globs='- /home/vagrant/.*
  - /home/vagrant/vim*'


  # backup jobs
  backup::duply {'sample':
    source      => '/home/vagrant/',
    target      => 'file://tmp/backup',
    target_pass => 'foo',
    target_user => 'bla',
    passphrase  => 'blabla',
    globs       => $globs
  }

  backup::schedule {'sample': }

  backup::duply {'s3-ex':
    source      => '/home/vagrant/',
    target      => 's3+http://myUniqueBucketName',
    target_pass => 'foo',
    target_user => 'bla',
    passphrase  => 'blabla',
    globs       => $globs
  }

  backup::schedule {'s3-ex':
    precondition => '-d /tmp',
    shapping     => {
      interface  => 'eth0',
      port       => '2222',
      limit      => '45kbps'
    }
  }

  include backup::copy

  class{'backup::dropbox':
    headless => true
  }

  include btsync::repo

  file{'/home/vagrant/btsync_test':
    ensure => directory,
    owner  => vagrant,
    group  => vagrant
  } ->

  class { 'btsync':
    instances => {
      vagrant => {
        storage_path => '/home/vagrant/.sync',
        use_upnp => false,
        webui        => {
          listen   => '0.0.0.0:8888',
          login    => 'admin',
          password => 'changeme',
        },
        shared_folders       => {
          'MY_SECRET_1'      => {
            dir              => '/home/vagrant/btsync_test',
            use_relay_server => true,
            use_tracker      => true,
            use_dht          => true,
            search_lan       => true,
            use_sync_trash   => true
          }
        }
      }
    }
  }
}


