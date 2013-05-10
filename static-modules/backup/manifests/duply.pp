# Sets up a duply backup job
class backup::duply(
  $backup_name='',
  $source='',
  $passphrase='',
  $target='',
  $user='',
  $password='',
  $max_age='1M',
  $max_full_backups='1',
  $max_fullbkp_age='1M',
  $volsize=50,
  $globs=''
  ) {

  package{['duplicity','duply']:
    ensure  => present
  }

  package{'python-boto':
    ensure  => present
  }

  file{['/etc/duply',"/etc/duply/${backup_name}"]:
    ensure => directory,
  }

  file { "/etc/duply/${backup_name}/exclude" :
    ensure  => file,
    content => $globs,
    owner   => root,
    require =>  [Package['duply'],File["/etc/duply/${backup_name}"]],
  }

  file{"/etc/duply/${backup_name}/conf":
    ensure  => file,
    content => template('backup/conf.erb'),
    owner   => root,
    require =>  [Package['duply'],File["/etc/duply/${backup_name}"]],
  }
}
