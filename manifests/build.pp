node default {
  include build
  include barbecue

  class{'jdk':
    version    => 8,
    enable_jce => false
  }

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>


}
