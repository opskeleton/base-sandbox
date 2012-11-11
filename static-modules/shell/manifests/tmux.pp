# Class: tmux
#
# This module manages tmux
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
class tmux {

  include git

  package {'tmux':
    ensure  => installed
  }

  $home = "/home/$username"

  git::clone {'.tmux':
    url   => 'git://github.com/narkisr/.tmux.git',
    dst   => "$home/.tmux",
    owner => $username
  }

  file {"$home/.tmux.conf":
    ensure  => link,
    target  => "$home/.tmux/.tmux.conf",
    require => Git::Clone['.tmux']
  }
}
