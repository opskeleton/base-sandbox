node 'desktop.local'{
  class{'desktop::x2go':
    server => true,
    lan    => '192.168.1.0/24'
  }
}

