# Yet another ssmtp module
class ssmtp(
  $email='',
  $host='',
  $user='',
  $pass='',
){

  package{'ssmtp':
    ensure  => present
  } ->

  file { '/etc/ssmtp/ssmtp.conf':
    ensure  => file,
    mode    => '0644',
    content => template('ssmtp/ssmtp.conf.erb'),
    owner   => root,
    group   => root,
  }

}
