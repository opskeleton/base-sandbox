# Installing spotify client
class desktop::spotify {

    apt::key {'spotify':
      key        => '94558F59',
      key_server => 'keyserver.ubuntu.com'
    }

    apt::source { 'spotify':
      location    => 'http://repository.spotify.com',
      release     => 'stable',
      repos       => 'non-free',
      include_src => false,
      require     => Apt::Key['spotify']
    }

    package { 'spotify-client-qt':
      ensure  => latest ,
      require => Apt::Source['spotify']
    }
}
