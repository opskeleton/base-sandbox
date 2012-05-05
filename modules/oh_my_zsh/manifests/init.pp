# Class: zsh_configuration
#
# This module manages zsh_configuration
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
class oh_my_zsh {
  
  $home = "/home/$username"

  exec{"clone oh-my-zsh":
    command => "git clone git://github.com/narkisr/oh-my-zsh.git .oh-my-zsh",
    cwd  => $home,
    user    => "root",
    path    => ['/usr/bin/'],
    unless  => "test -d $home/.oh-my-zsh"
  }

  file { "$home/.zshrc":
   ensure => link,
   target => "$home/.oh-my-zsh/.zshrc",
   require  => Exec["clone oh-my-zsh"]
  }

  file { "$home/.oh-my-zsh":
   group    => $username,
   owner    => $username,
   mode     => "0644",
   require  => Exec["clone oh-my-zsh"]
  }

}
