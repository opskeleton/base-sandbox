class vim::purge {
  package {"vim":
    ensure => "absent"
  }

  package {"vim-tiny":
    ensure => "absent"
  }
}
