node default {

  Package {
    provider => pkgng
  }

  include shell
  include baseline::celestial

  class{'vim':
    repo => 'git://github.com/narkisr/vim-lite.git'
  }
}
