node default {
  include apt
  include langs
  include langs::erlang

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>
}
