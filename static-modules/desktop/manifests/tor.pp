# Setting up tor bundle
class desktop::tor {
  apt::ppa {'ppa:webupd8team/tor-browser':
  } ->

  package{'tor-browser':
    ensure  => present
  }
}
