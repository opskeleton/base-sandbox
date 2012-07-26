# Class: ack
#
# This module manages ack
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
class ack {
 
  $ackurl = "https://raw.github.com/gist/3179352/c0f1e290dae9e23f3627b0f4263d63f69044a9f3/.ackrc"

  package{"ack-grep":
    ensure  => present  
  }
 
  exec {".ackrc":
     command => "/usr/bin/curl $ackurl  -o $home/.ackrc",
     creates => "$home/.ackrc",
     timeout => 10,
     require => Package["curl"],
  }

  file{"/usr/bin/ack":
    ensure  => link,
    target => "/usr/bin/ack-grep", 
    require  => Package["ack-grep"]
  }
}
