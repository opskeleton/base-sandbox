# Class: src
#
# This module manages src
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
class vim-src {


  $python = $lsbdistrelease? {
   "11.04" => "python2.7",
   "10.10" => "python2.6"
  }


   package {"mercurial":
    ensure => "installed"
   }

  if $vim_version !='Vi IMproved 7.3' {
   file { "/tmp/vim":
      ensure => directory
   }

  vcsrepo { "/tmp/vim":
      ensure   => present,
      provider => hg,
      source   => 'https://vim.googlecode.com/hg/',
      require  => File["/tmp/vim"],
      revision => 'v7-3-162'
  } 

  package {"python-dev":
    ensure => "installed"
  }

  package {"ncurses-dev":
    ensure => "installed"
  }

 exec {"configure_vim" :
    command => "/tmp/vim/configure --enable-multibyte --enable-cscope --enable-xim --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib/$python/config --disable-largefile --with-features=big",
    cwd     => "/tmp/vim/",
    path    => ["/usr/bin/","/bin/"],
    require => [Package["ncurses-dev"], Package["python-dev"],Vcsrepo["/tmp/vim"]],
    timeout => 0,
    user    => "root"
  }

  exec {"make_vim" :
    command => "make",
    cwd     => "/tmp/vim/",
    path    => "/usr/bin:/usr/sbin:/bin",
    require => Exec["configure_vim"],
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
}
