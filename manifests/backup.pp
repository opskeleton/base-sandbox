node default {
  include clamav
  include backup::zbackup
  include backup::rclone
  include backup::octo
  include apt

  # class {'backup::dropbox':
  #  headless => true
  # }
  #
  clamav::scan { 'all-but-sys-and-dev':
    exclude_dir => ['(?i)/^\/(sys|dev)/'],
    scan        => ['/'],
    enable      => true,
    email       => 'gookup@gmail.com'
  }

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>
}


