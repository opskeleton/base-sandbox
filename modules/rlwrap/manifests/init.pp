# Class: rlwrap
#
# This module manages rlwrap
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
class rlwrap {
 
  package{"rlwrap":
    ensure  => present
  }

  dots::link_dot{ '.inputrc':}
}
