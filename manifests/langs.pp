node default {
  include apt
  include langs
  include langs::go
  include langs::erlang

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>
}
