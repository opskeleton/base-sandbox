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
 
  package{"ack-grep":
    ensure  => present  
  }
 

  dots::link_dot{'.ackrc':}

  file{"/usr/bin/ack":
    ensure  => link,
    target => "/usr/bin/ack-grep", 
    require  => Package["ack-grep"]
  }
}
