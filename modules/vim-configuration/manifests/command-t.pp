class vim-configuration::command-t($user) {
 package{"ruby1.8-dev":
 	ensure	=> installed
 }

 exec{"configure command-t":
 	user	   => "root",
 	cwd	   => "/home/$user/.vim/bundle/command-t/ruby/command-t", 
      require  => [Vcsrepo["/home/$user/.vim"],Package["ruby1.8-dev"]],
      path     => ["/usr/bin/","/bin/"],
      command  => "ruby extconf.rb",
      subscribe => Vcsrepo["/home/$user/.vim"],
      refreshonly => true

 }

 exec{"make clean command-t":
 	user	   => "root",
 	cwd	   => "/home/$user/.vim/bundle/command-t/ruby/command-t", 
      require  => [Exec["configure command-t"]], 
      path     => ["/usr/bin/","/bin/"],
      command  => "make clean",
      subscribe => Exec["configure command-t"],
      refreshonly => true
 }
 
 exec{"make command-t":
 	user	   => "root",
 	cwd	   => "/home/$user/.vim/bundle/command-t/ruby/command-t", 
      require  => [Exec["configure command-t"]], 
      path     => ["/usr/bin/","/bin/"],
      command  => "make",
      subscribe => Exec["make clean command-t"],
      refreshonly => true
 }
}
