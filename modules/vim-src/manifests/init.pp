# Class: src
#
# This module manages src
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
import "vim_gui.pp"
import "vim_purge.pp"
import "vim_build.pp"
class vim-src {

  $python = $lsbdistrelease? {
   "11.04" => "python2.7",
   "10.10" => "python2.6"
  }

  $config_flags = $is_desktop? {
     "true"  => "--with-features=huge --enable-gui=gnome2",
     "false" => "--with-features=big"
  }  

   if $is_desktop == "true" {
   include vim::gui::packages
  }

  if $vim_version !="Vi IMproved 7.3 Included patches: 1-162" {
   include vim::purge
   include vim::build
  }
}
