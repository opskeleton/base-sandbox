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
class vim {

  $vim_pack = $is_desktop? {
     "true"  => "vim-gtk",
     "false" => "vim-nox"
  }  

  package{$vim_pack:
    ensure  => present
  }
}
