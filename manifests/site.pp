
node basenode {
  include "vim-src"
  include "vim-configuration"
}
node 'natty' inherits basenode {
}

node 'zsh' inherits basenode {
}
