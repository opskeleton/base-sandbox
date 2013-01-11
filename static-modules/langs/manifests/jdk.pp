# A class which sets up jdk
class langs::jdk {
  include apt

  apt::ppa { 'ppa:webupd8team/java': }

  package{'oracle-java6-installer':
    ensure  => present,
    require => [Apt::Ppa['ppa:webupd8team/java'],
                Exec['skipping license approval']]
  }
  $prop = 'accepted-oracle-license-v1-1'
  $echo = "/bin/echo  'oracle-java6-installer shared/$prop boolean true'"
  $set_selections = '/usr/bin/debconf-set-selections'
  $get_selections = '/usr/bin/debconf-get-selections'

  exec{'skipping license approval':
    command => "${echo} | ${set_selections}",
    user    => 'root',
    require => Apt::Ppa['ppa:webupd8team/java'],
    unless  => "$get_selections | /bin/grep $prop"
  }
}
