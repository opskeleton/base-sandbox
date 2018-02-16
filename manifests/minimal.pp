node default {
  include shell
  include vim
  include git::configure
  include baseline
  include baseline::mirror
  include baseline::security
  include baseline::ssh::config
  include baseline::reops
  include timezone
  include barbecue
}
