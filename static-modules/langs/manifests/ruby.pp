# Class: ruby
#
# This module manages ruby
class ruby {

  package{['rubygems','rake','ruby1.9.1-dev']:
    ensure  => installed
  }

  include rvm

  rvm::system_user { $username: }

  $ruby9 = 'ruby-1.9.3'

  if $rvm_installed=="true" {
    rvm_system_ruby {
      $ruby9:
        ensure      => 'present',
        default_use => true;
    }

    rvm_gem {
      'bundler':
        ruby_version => $ruby9,
        require      => Rvm_system_ruby[$ruby9];
      'rake':
        ruby_version => $ruby9,
        require      => Rvm_system_ruby[$ruby9];
    }
  }
}
