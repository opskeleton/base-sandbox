# == Class: modules/desktop
#
# Sets up a list of desktop packages
# (checks if its an Ubuntu based desktop system first).
#
# === Parameters
#
#
# === Variables
#
# === Examples
#
# include desktop
#
# === Authors
#
# Ronen Narkis narkisr@gmail.com
#
# === Copyright
#
# Copyright 2011 narkisr.com, unless otherwise noted.
#
class desktop($username='',$home='') {

  if($desktop::is_desktop == 'true'){
    class{'desktop::xmonad':
      home     => hiera('home'),
      username => hiera('user')
    }
    include desktop::rxvt
    include desktop::spotify
    include desktop::netflix
    include desktop::misc

<<<<<<< Updated upstream
    class {'virtualbox': }
    class {'googlechrome': }
=======
    class { 'virtualbox': }
    class { 'googlechrome': }
    package{['gnome-do','gparted']:
      ensure  => present
    }

>>>>>>> Stashed changes
  }
}
