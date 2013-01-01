# A class which sets up jdk
class langs::jdk {
  include apt

  apt::ppa { 'ppa:webupd8team/java': }

  package{'oracle-java6-installer':
    ensure  => present,
    require => [Apt::Ppa['ppa:webupd8team/java'],
                Exec['skipping license approval']]
  }
  $echo = "/bin/echo  'oracle-java6-installer shared/accepted-oracle-license-v1-1 boolean true'"
  $set_selections = '/usr/bin/debconf-set-selections'

  exec{'skipping license approval':
    command => "${echo} | ${set_selections}",
    user    => 'root',
    require => Apt::Ppa['ppa:webupd8team/java'],
  }
}
