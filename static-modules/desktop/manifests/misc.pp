# Misc desktop packages
class desktop::misc {
  package{['kupfer','vlc','recordmydesktop']:
      ensure  => present
  }

  editfile::config { 'disable apport':
    ensure => '0',
    path   => '/etc/default/apport',
    quote  => false,
    sep    => '=',
    entry  => 'enabled',
  }

}
