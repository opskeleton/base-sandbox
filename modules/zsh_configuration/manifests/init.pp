# Class: zsh_configuration
#
# This module manages zsh_configuration
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
class zsh_configuration($user = "ronen") {

  vcsrepo { "/home/$user/.oh-my-zsh":
    ensure   => present,
    provider => git,
    source   => 'git://github.com/narkisr/oh-my-zsh.git',
    require  => [Package["git-core"],Package["zsh"]]
  }  

  file { "/home/$user/.zshrc":
   ensure => link,
   target => "/home/$user/.oh-my-zsh/.zshrc",
   require  => [Vcsrepo["/home/$user/.oh-my-zsh"]]
  }

  file { "/home/$user/.oh-my-zsh":
   group => $user,
   mode => "0644",
   require  => [Vcsrepo["/home/$user/.oh-my-zsh"]]
  }

  notify {"please re-login in order to use your new zsh shell :)":}
}
