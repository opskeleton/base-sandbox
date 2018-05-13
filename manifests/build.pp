node default {
  include build
  include build::boot
  include build::gradle
  include build::sbt
  include barbecue

  package{'openjdk-8-jdk':
    ensure  => present
  }

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>


}
