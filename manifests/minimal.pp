node 'minimal.local'{
  include apt
  include shell
  include vim
  include git::configure
  include baseline
  include baseline::update
  include baseline::celestial
  include timezone
  include barbecue
  include barbecue::packages
}
