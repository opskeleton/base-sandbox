# Class: z
#
# This module manages z
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
class z {
  
  exec{"clone z":
    command  => 'git clone git@github.com:narkisr/z.git',
    user  => 'root',
      => 
  }
  common::archive { "z":
     ensure => present,
     url => "https://github.com/downloads/narkisr/z/z.tar.gz", 
     target => "/opt/",
     checksum => false, 
     follow_redirects => true
  }
}
