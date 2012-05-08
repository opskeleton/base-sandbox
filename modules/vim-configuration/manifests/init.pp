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

  $home = "/home/$username"
  $dot_vim= "$home/.vim"

  git::clone {$dot_vim:
    url   => 'git://github.com/narkisr/.vim.git',
    dst   => $dot_vim,
    owner => $username
  }

  exec{".vim submodules":
    command  => "/bin/bash `git submodule update --init`" ,
    returns  => [2,0],
    cwd => $dot_vim,
    path     => ['/usr/bin/','/bin'],
    user     => $username,
    require  => Git::Clone[$dot_vim],
    provider => shell
  }

  file { "$home/.vimrc":
    ensure => link,
    target => "$dot_vim/.vimrc",
    require  => Git::Clone[$dot_vim]
  }

  class {"vim-configuration::command-t": dot_vim => $dot_vim}

  package{"ctags":
    ensure	=> installed
  }
}
