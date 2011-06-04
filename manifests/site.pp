
$www_user="narkisr"
$email = "narkisr@gmail.com"

class basenode($user) {
 class { git: user=> $www_user, email => $email}
 include "build_essential"
 include "vim-src"
 class { "vim-configuration": user => $user}
 class { "zsh": user => $user}
 class { "zsh_configuration" : user => $user}
 class { "z": user => $user}
 include "local_security"
 include "apt"
 include "apt::unattended-upgrade::automatic"
}

class development($user) {
  class{"basenode": user => $user}
  # class{"nodejs::npm": user => $user}
  class{"nodejs": user => $user}
  include "coffeescript"
  include "ruby"
}

class dev_with_user {
  class {"development": user => "ronen"}
}

node "puppet" {
    include dev_with_user
}

node "puppet-client" {
    include dev_with_user
}

node "puppet-client2" {
    include dev_with_user
}

node "Uranus" {
    include dev_with_user
}

node "cobbler" {
    include basenode
}
