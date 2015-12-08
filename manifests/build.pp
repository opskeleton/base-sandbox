node default {
  include build
  include barbecue

  class{'jdk':
    version => 7
  }

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>


}
