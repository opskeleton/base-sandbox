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

  $repos = {
    appliances  => {
      directory => '~/appliances-1',
      ro        => false,
      nodes     => ['1', '2']
    }
  }

  $nodes = {
    '1' => {name => 'foo' , address => 'foo:1234'} ,
    '2' => {name => 'bar' address   => 'bar:22000'} 
  }

  class{'backup::syncthing':
    repos => $repos,
    nodes => $nodes
  }

  class{'backup::dropbox':
    headless => true
  }

  include backup::attic
}


