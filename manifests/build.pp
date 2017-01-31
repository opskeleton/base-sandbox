node default {
  include build
  include barbecue

  class{'jdk':
    version => 8
  }

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>


}
