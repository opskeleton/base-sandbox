node 'minimal.local'{
  include apt
  include shell
  include vim
  include baseline
  include baseline::update
}
