node 'backup.local'{
  include clamav

  clamav::scan { 'all-but-sys-and-dev':
    exclude_dir => ['(?i)/^\/(sys|dev)/'],
    scan        => ['/'],
    enable      => true,
    email       => 'gookup@gmail.com'
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

  backup::schedule {'sample':
    onsuccess => '/usr/sbin/ssmtp foo@gmail.com </etc/duply/sample-msg.txt'
  }

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

  class{'backup::copy':
    reinstall => true
  }

  $repos = {
    appliances  => {
      directory => '~/appliances-1',
      ro        => false,
      nodes     => [
        'C56YYFN-U7QEMMU-2J3DVM4-RFHHNAT-FH7ATN6-VJSREZY-XKYXPOF-RSKC7QE',
      ]


    }
  }

  $nodes = {
    'C56YYFN-U7QEMMU-2J3DVM4-RFHHNAT-FH7ATN6-VJSREZY-XKYXPOF-RSKC7QE' => {name => 'foo' , address => 'foo:1234'},
  }


  class{'backup::syncthing':
    repos => $repos,
    nodes => $nodes,
    token => 'mhfu4ugmsauj6cgvsu68kvloa1gt3v'
  }

  include monitoring

  class{'monitoring::syncthing':
    token => 'mhfu4ugmsauj6cgvsu68kvloa1gt3v'
  }

  class{'monitoring::serverspec':
    name  => 'backup',
    repo  => 'git://github.com/narkisr/puppet-base-env.git',
    dst   => '/opt/puppet-base-env',
    specs => 'backup/*'
  }

  class{'backup::dropbox':
    headless => true
  }

  include backup::attic
}


