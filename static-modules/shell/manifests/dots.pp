# Class: dots
#
# This module manages dots
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
class dots {

  $dots_home = "$home/.dots"
  $dots_repo = 'git://github.com/narkisr/dots.git'

  git::clone { $dots_home:
    url   => $dots_repo,
    dst   => $dots_home,
    owner => $username
  }

  define link_dot() {
    file{"${home}/${name}":
      ensure => link,
      target => "${dots::dots_home}/${name}",
      require  => Git::Clone[$dots::dots_home]
    }
  }
}
