node default {
  include apt
  include langs

  package{'software-properties-common':
    ensure  => present
  } -> Exec <||>
}
