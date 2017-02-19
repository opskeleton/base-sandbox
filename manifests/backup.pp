node default {
  include clamav
  include apt

  clamav::scan { 'all-but-sys-and-dev':
    exclude_dir => ['(?i)/^\/(sys|dev)/'],
    scan        => ['/'],
    enable      => true,
    email       => 'gookup@gmail.com'
  }


  class{'backup::zbackup':}
  class{'backup::rclone':}
  class{'backup::octo':}

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>

}


