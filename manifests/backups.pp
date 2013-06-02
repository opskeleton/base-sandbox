# set your backup jobs, use import 'backups.pp' to use them:

$globs='- /home/vagrant/.*
- /home/vagrant/vim*'


# backup jobs
backup::duply {'sample':
  source      => '/home/vagrant/',
  target      => 'file://tmp/backup',
  globs       => $globs
}

backup::schedule {'sample':
  hour    => '3',
  type    => 'duply',
  trickle => '60'
}

backup::duply {'s3-ex':
  source      => '/home/vagrant/',
  target      => 's3+http://myUniqueBucketName',
  target_pass => 'foo',
  target_user => 'bla',
  globs       => $globs
}

backup::schedule {'s3-ex':
  hour    => '3',
  type    => 'duply',
}
