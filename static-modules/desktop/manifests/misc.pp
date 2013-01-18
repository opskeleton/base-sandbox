# Misc desktop packages
class desktop::misc {
  package{['gnome-do','vlc','recordmydesktop']:
      ensure  => present
  }
}
