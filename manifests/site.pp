
class basenode {
  include "build_essential"
  include "vim-src"
  include "vim-configuration"
  include "zsh"
  include "zsh_configuration"
  include "z"
  include "local_security"
}

class development inherits basenode {
  include "build_essential"
  include "nodejs"
  include "nodejs::npm"
}

node "puppet" {
  include basenode
}

node "puppet-client" {
 include development
}

node "Uranus" {
  include basenode
}

node "cobbler" {
 include basenode
}
