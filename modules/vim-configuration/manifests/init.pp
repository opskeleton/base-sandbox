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
class vim-configuration($user = "ronen") {
  package { "git-core":
   ensure => "installed"
  }

  vcsrepo { "/home/$user/.vim":
      ensure   => present,
      provider => git,
      source   => 'git://github.com/narkisr/.vim.git',
      require  => [Package["git-core"]]
  }  

 file { "/home/$user/.vimrc":
  ensure => link,
  target => "/home/$user/.vim/.vimrc",
  require  => [Vcsrepo["/home/$user/.vim"]]
 }

 file { "/home/$user/.vim":
   group => $user,
   mode => 644,
   require  => [Vcsrepo["/home/$user/.vim"]]
 }


}
