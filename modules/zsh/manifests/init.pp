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
class zsh($user = 'ronen') {

  package { "zsh":
     ensure => installed
  }
  
  exec {"default shell":
   command => "chsh -s /bin/zsh $user", 
   path    => ["/usr/bin/","/bin/"],
   require => [Package["zsh"]],
   user    => "root"
  }
}
