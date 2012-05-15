class vim-configuration::snipmate($dot_vim) {

  exec{'deploy snipmate-snippets':
    command  => 'rake deploy_local',
    cwd	   => "$dot_vim/bundle/snipmate-snippets", 
    user	   => $username,
    path     => ['/usr/local/rvm/bin/','/bin'],
    require  => [Git::Clone[$dot_vim],Package['ruby1.8-dev'],Exec['.vim submodules']],
    subscribe => Git::Clone[$dot_vim],
    refreshonly => true
  }

}
