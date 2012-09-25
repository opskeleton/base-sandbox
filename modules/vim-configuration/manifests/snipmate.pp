class vim-configuration::snipmate($dot_vim) {

   exec{'deploy snipmate-snippets':
     command     => 'rsync -av --delete . ~/.vim/bundle/snipmate/snippets/',
     cwd         => "$dot_vim/bundle/snipmate-snippets",
     user        => $username,
     path        => ['/usr/local/rvm/bin/','/bin','/usr/bin',],
     require     => [Git::Clone[$dot_vim],Exec['.vim submodules']],
     subscribe   => Git::Clone[$dot_vim],
     refreshonly => true
   }

}
