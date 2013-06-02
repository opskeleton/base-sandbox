# == Class: modules/desktop
#
# Sets up a list of desktop packages
# (checks if its an Ubuntu based desktop system first).
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
    # include desktop::rxvt
    # include desktop::spotify
    # include desktop::netflix
    include desktop::misc

    class { 'virtualbox': }
    package{'gparted':
      ensure  => present
    }

  #  class { 'idea::community':
  #    version => '12.0.2',
  #  }
  }
}
