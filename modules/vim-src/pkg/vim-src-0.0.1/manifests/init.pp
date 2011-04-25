# Class: src
#
# This module manages src
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
class src {


   file { "/tmp/vim":
      ensure => directory,
   }
   vcsrepo { "/tmp/vim":
      ensure   => latest,
      provider => hg,
      source   => 'https://vim.googlecode.com/hg/',
      require  => File["/tmp/vim"],
   } 

}
