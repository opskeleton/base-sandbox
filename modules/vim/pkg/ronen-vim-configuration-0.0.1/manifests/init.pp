# Class: vim-configuration
#
# This module manages vim-configuration
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
class vim-configuration {
  vcsrepo { "/home/ronen/vim":
      ensure   => present,
      provider => git,
      source   => 'git://github.com/narkisr/.vim.git',
  }  

}
