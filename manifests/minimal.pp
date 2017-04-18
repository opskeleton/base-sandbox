node default {
  include apt
  include shell
  include vim
  include git::configure
  include baseline
  include baseline::ssh::config
  include baseline::update
  include timezone
  include barbecue
}
