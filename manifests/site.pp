
$user = "ronen"
$www_user="narkisr"
$email = "narkisr@gmail.com"

stage {"pre": before => Stage["main"]}
Vcsrepo {stage => "main"}
class basenode {
  class { git: user=> $www_user, email => $email,stage => pre}
  include "build_essential"
  include "vim-src"
  class { vim-configuration: user => $user}
  class { "zsh": user => $user}
  include "zsh_configuration"
  class { "z": user => $user}
  include "local_security"
  include "apt"
  include "apt::unattended-upgrade::automatic"
}

class development {
  include basenode
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

node "puppet-client2" {
 include development
}

node "Uranus" {
  include development
}

node "cobbler" {
 include basenode
}
