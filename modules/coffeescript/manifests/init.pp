# Class: coffeescript
#
# This module manages coffeescript
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
include "nodejs"
class coffeescript {
 
if $node_installed == "true" {
  package {"coffee-script":
    provider => npm, 
    ensure   => "installed"
  }
}
}
