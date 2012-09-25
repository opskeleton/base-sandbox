class vim-configuration::snipmate($dot_vim) {

   exec{'deploy snipmate-snippets':
     command     => "rsync -av --delete . $dot_vim/bundle/snipmate/snippets/",
     cwd         => "$dot_vim/bundle/snipmate-snippets",
     user        => $username,
     path        => ['/usr/local/rvm/bin/','/bin','/usr/bin',],
     require     => [Git::Clone[$dot_vim],Exec['.vim submodules']],
     subscribe   => Exec['.vim submodules'],
     refreshonly => true
   }

}
