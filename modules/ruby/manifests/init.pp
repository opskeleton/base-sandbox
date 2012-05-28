# Class: ruby
#
# This module manages ruby
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
class ruby {
  
  include ruby::installations
  
  package{['rubygems','rake']:
    ensure  => installed
  }
}
