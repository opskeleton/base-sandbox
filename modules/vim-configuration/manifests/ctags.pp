class vim-configuration::ctags {
  
  package{"ctags": ensure	=> installed }

  dots::link_dot{'.ctags':}
}
