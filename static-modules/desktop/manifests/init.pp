# == Class: modules/desktop
#
# Sets up a list of desktop packages (checks if its an Ubuntu based desktop system first).
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
      home     => $home,
      username => $username
    }
    include desktop::rxvt
    include desktop::spotify
    include desktop::netflix
    class { 'googlechrome': }

  }
}
