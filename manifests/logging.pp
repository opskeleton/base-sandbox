node 'logging.local'{
  include apt
  include logging::sysdig
  include logging::syslog

  class{'logging::logwatch':
    email    => 'foo@gmail.com',
    mailfrom => 'bar@gmail.com'
  }


  class{'ssmtp':
    email   => 'foo@gmail.com',
    mailhub => 'gmail.com',
    user    => 'foo',
    pass    => 'bar'
  }
}

