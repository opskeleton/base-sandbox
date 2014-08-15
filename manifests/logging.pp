node 'logging.local'{
  include logging::sysdig

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

