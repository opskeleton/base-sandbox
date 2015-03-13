node default {
  include autossh
  autossh::config {'test':
    user        => 'vagrant',
    remote_user => 'vagrant',
    remote_host => 'localhost',
    remote_port => '22',
    ssh_id_file => '/home/vagrant/.ssh/id_rsa',
    ssh_config  => '-R 1234:localhost:22'
  }
}
