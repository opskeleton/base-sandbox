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
class oh_my_zsh  {
  

  common::archive { ".oh-my-zsh":
     ensure => present,
     url => "https://github.com/downloads/narkisr/oh-my-zsh/.oh-my-zsh.tar.gz", 
     target => "/home/$username",
     checksum => false, 
     follow_redirects => true
  }

  file { "/home/$username/.zshrc":
   ensure => link,
   target => "/home/$username/.oh-my-zsh/.zshrc",
   require  => Common::Archive[".oh-my-zsh"]
  }

  file { "/home/$username/.oh-my-zsh":
   group    => $username,
   owner    => $username,
   mode     => "0644",
   require  =>  Common::Archive[".oh-my-zsh"]
  }

}
