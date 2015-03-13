node default {
  include autossh
  autossh::config {'test':
    user         => 'vagrant',
    remote_user  => 'vagrant',
    remote_host  => 'localhost',
    remote_port  => '22',
    port_forward => '1234',
    ssh_id_file  => '/home/vagrant/.ssh/id_rsa',
    ssh_config   => '/home/vagrant/.ssh/config'
  }
}
