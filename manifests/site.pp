
$user = "ronen"
$www_user="narkisr"
$email = "narkisr@gmail.com"

class basenode {
  include "build_essential"
  include "vim-src"
  class{ git: user=> $www_user, email => $email}
  include "vim-configuration"
  include "zsh"
  include "zsh_configuration"
  include "z"
  include "local_security"
}

class development inherits basenode {
  include "nodejs"
  include "nodejs::npm"
  include "coffeescript"
}

node "puppet" {
  include basenode
}

node "puppet-client" {
 include development
}

node "Uranus" {
  include development
}

node "cobbler" {
 include basenode
}
