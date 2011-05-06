
node basenode {
  include "vim-src"
  include "vim-configuration"
  include "zsh"
  include "zsh_configuration"
  include "z"
}
node 'natty' inherits basenode {
}

node 'zsh' inherits basenode {
}
