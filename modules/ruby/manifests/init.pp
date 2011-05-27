# Class: ruby
#
# This module manages ruby
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class ruby {

  include "rvm::system"
  
  $ruby9 = 'ruby-1.9.2-p180'
  $ruby8 = 'ruby-1.8.7-p334'


  # rvm::system_user { $user: ; }

  rvm_system_ruby {
    $ruby9:
        ensure => 'present',
        default_use => true;
     $ruby8:
        ensure => 'present',
        default_use => false;
  }

  rvm_gem {
     'bundler':
	    ruby_version => $ruby8,
	    ensure => '1.0.13',
	    require => Rvm_system_ruby[$ruby8];
  }

}
