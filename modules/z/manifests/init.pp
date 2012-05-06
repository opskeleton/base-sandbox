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

  git::clone {'z':
    url   => 'git://github.com/narkisr/z.git',
    dst   => "/opt/z",
    owner => $username
  }
}
