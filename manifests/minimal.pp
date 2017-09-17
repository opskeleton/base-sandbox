node default {
  include shell
  include vim
  include git::configure
  include baseline
  include baseline::mirror
  include baseline::ssh::config
  include baseline::update
  include timezone
  include barbecue
  include os_hardening
}
