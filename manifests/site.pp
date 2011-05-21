
$user = "ronen"
$www_user="narkisr"
$email = "narkisr@gmail.com"

class basenode {
  include "build_essential"
  include "vim-src"
  class { git: user=> $www_user, email => $email}
  class { vim-configuration: user => $user}
  class { "zsh": user => $user}
  include "zsh_configuration"
  include "z"
  include "local_security"
  include "apt"
  include "apt::unattended-upgrade::automatic"
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
