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
  
  common::archive { "z":
     ensure => present,
     url => "https://github.com/downloads/narkisr/z/z.tar.gz", 
     target => "/opt/",
     checksum => false, 
     follow_redirects => true
  }
}
