node default {
  include backup::zbackup
  include backup::rclone
  include backup::octo
  include backup::restic
  include apt

  class {'backup::dropbox':
    headless => true
  }

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>
}


