class vim::build {

   $python = $lsbdistrelease? {
    "11.04" => "python2.7",
    "10.10" => "python2.6"
   }

   package {"mercurial":
     ensure => "installed"
   }

   package {"python-dev":
      ensure => "installed"
   }

   package {"ncurses-dev":
	  ensure => "installed"
   }

   file { "/tmp/vim":
      ensure => directory
   }

   vcsrepo { "/tmp/vim":
      ensure   => present,
      provider => hg,
      source   => "https://vim.googlecode.com/hg/",
      require  => File["/tmp/vim"],
      revision => 'v7-3-162'
  } 


  exec {"configure_vim" :
    command => "/tmp/vim/configure --enable-multibyte --enable-cscope --enable-xim --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib/$python/config --disable-largefile $config_flags",
    cwd     => "/tmp/vim/",
    path    => ["/usr/bin/","/bin/"],
    require => [Package["ncurses-dev"], Package["python-dev"], Vcsrepo["/tmp/vim"], Package["vim"],Package["vim-tiny"]],
    timeout => 0,
    user    => "root"
  }

  exec {"make_vim" :
    command => "make",
    cwd     => "/tmp/vim/",
    path    => "/usr/bin:/usr/sbin:/bin",
    require => [ Exec["configure_vim"], Package["build-essential"] ],
    timeout => 0,
    user    => "root"
  }

  exec {"install_vim" :
    command => "make install",
    cwd     => "/tmp/vim/",
    path    => "/usr/bin:/usr/sbin:/bin",
    require => Exec["make_vim"],
    timeout => 0,
    user    => "root"
  }
}
