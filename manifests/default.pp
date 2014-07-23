node default {
  include git
  include shell
  include baseline
  include langs
  include vim
  include build
  # include barbecue
  # include barbecue::packages
  include vagrant
  include docker
  include virtualbox
  include kvm
  include desktop
}

