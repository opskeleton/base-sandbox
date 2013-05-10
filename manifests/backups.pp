# set your backup jobs, use import 'backups.pp' to use them:

$globs='- /home/vagrant/.*
- /home/vagrant/vim*'


# backup jobs
class {'backup::duply':
  backup_name => 'example',
  source      => '/home/vagrant/',
  target      => 'file://tmp/backup',
  user        => 'vagrant',
  password    => 'vagrant',
  globs       => $globs
}

class {'backup::schedule':
  hour        => '3',
  type        => 'duply',
  backup_name => 'example'
}
