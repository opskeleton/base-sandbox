class ruby::installations {

  include rvm

  rvm::system_user { $username: }

  $ruby9 = 'ruby-1.9.2'
  $ruby8 = 'ruby-1.8.7'


  if $rvm_installed==true {
    rvm_system_ruby {
      $ruby9:
        ensure      => 'present',
        default_use => false;
      $ruby8:
        ensure      => 'present',
        default_use => true;
    }

    rvm_gem {
      'bundler':
        ruby_version => $ruby8,
        require      => Rvm_system_ruby[$ruby8];
      'rake':
        ruby_version => $ruby8,
        require      => Rvm_system_ruby[$ruby8];
    }
  }
}
