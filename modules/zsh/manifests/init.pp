# Class: zsh
#
# This module manages zsh
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
class zsh {

  package { "zsh":
     ensure => installed
  }
  
  exec {"default shell":
   command     => "chsh -s /bin/zsh $username", 
   path        => ["/usr/bin/","/bin/"],
   require     => [Package["zsh"]],
   user        => "root", 
   refreshonly => true,
   subscribe   =>  Package["zsh"]
  }
}
