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
class z($user){

  vcsrepo { "/opt/z":
      ensure   => present,
      provider => git,
      source   => "https://github.com/rupa/z.git",
      require  => [Package["git-core"], Vcsrepo["/home/$user/.oh-my-zsh"]], 
      revision => "HEAD"
  }
  
}
