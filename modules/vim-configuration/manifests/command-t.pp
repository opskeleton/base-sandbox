class vim-configuration::command-t($dot_vim) {

  package{"ruby1.8-dev":
    ensure	=> installed
  }

  exec{'configure command-t':
    command  => 'ruby extconf.rb',
    cwd	   => "$dot_vim/bundle/command-t/ruby/command-t", 
    user	   => 'root',
    path     => ['/usr/bin/','/bin/'],
    require  => [Git::Clone[$dot_vim],Package['ruby1.8-dev'],Exec['.vim submodules']],
    subscribe => Git::Clone[$dot_vim],
    refreshonly => true

  }

  exec{'make clean command-t':
    user	   => "root",
    cwd	   => "$dot_vim/bundle/command-t/ruby/command-t", 
    require  => Exec['configure command-t'], 
    path     => ['/usr/bin/','/bin/'],
    command  => "make clean",
    subscribe => Exec['configure command-t'],
    refreshonly => true
  }

  exec{'make command-t':
    user	   => 'root',
    cwd	   => "$dot_vim/bundle/command-t/ruby/command-t", 
    path     => ['/usr/bin/','/bin/'],
    command  => 'make',
    require  => Exec['configure command-t'], 
    subscribe => Exec['make clean command-t'],
    refreshonly => true
  }
}
