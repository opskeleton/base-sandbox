node default {
  include build
  include build::boot
  include build::gradle
  include build::sbt
  include barbecue

  class{'jdk':
    version    => '8',
    enable_jce => true
  }

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>


}
