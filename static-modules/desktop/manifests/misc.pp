# Misc desktop packages
class desktop::misc {
  package{['kupfer','vlc','recordmydesktop']:
      ensure  => present
  }
}
