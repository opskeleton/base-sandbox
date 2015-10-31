node default {
  include clamav
  include apt

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

  backup::duply::schedule {'sample':
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

  backup::duply::schedule {'s3-ex':
    precondition => '-d /tmp',
    email        => 'foo@gmail.com',
    shapping    => {
      interface => 'eth0',
      port      => '2222',
      limit     => '45kbps'
    },
  }

  $nodes = {
    'C56YYFN-U7QEMMU-2J3DVM4-RFHHNAT-FH7ATN6-VJSREZY-XKYXPOF-RSKC7QE' => {name => 'foo' , address => 'foo:1234'},
  }
  
  class{'backup::dropbox':
    headless => true
  }

  class{'backup::zbackup':}

  class{'backup::rclone':}

}


