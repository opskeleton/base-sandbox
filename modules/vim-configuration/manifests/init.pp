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
      require  => [Package["git-core"]], 
      revision => "HEAD"
  }  

 file { "/home/$user/.vimrc":
  ensure => link,
  target => "/home/$user/.vim/.vimrc",
  require  => [Vcsrepo["/home/$user/.vim"]]
 }

 file { "/home/$user/.vim":
   group => $user,
   mode => 644,
   require  => [Vcsrepo["/home/$user/.vim"]], 
 #   recurse	=> true,
   # checksum => none
 }

 package{"ruby1.8-dev":
 	ensure	=> installed
 }

 exec{"configure command-t":
 	user	   => "root",
 	cwd	   => "/home/$user/.vim/bundle/command-t/ruby/command-t", 
      require  => [Vcsrepo["/home/$user/.vim"],Package["ruby1.8-dev"]],
      path     => ["/usr/bin/","/bin/"],
      command  => "ruby extconf.rb"
 }

 exec{"make clean command-t":
 	user	   => "root",
 	cwd	   => "/home/$user/.vim/bundle/command-t/ruby/command-t", 
      require  => [Exec["configure command-t"]], 
      path     => ["/usr/bin/","/bin/"],
      command  => "make clean"
 }
 
 exec{"make command-t":
 	user	   => "root",
 	cwd	   => "/home/$user/.vim/bundle/command-t/ruby/command-t", 
      require  => [Exec["configure command-t"]], 
      path     => ["/usr/bin/","/bin/"],
      command  => "make"
 }
}
