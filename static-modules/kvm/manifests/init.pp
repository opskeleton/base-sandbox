# setting up kvm on Ubuntu
class kvm($user=false) {

  validate_string($user)

  $forward = '-I FORWARD -m physdev --physdev-is-bridged -j ACCEPT'

  ensure_resource('class','ufw',{})

  package{['qemu-kvm', 'libvirt-bin', 'bridge-utils', 'virt-manager']:
    ensure  => present
  }

  ~> exec{'forward bridge':
    command => "sed -i '/^COMMIT/i ${forward}' /etc/ufw/before.rules",
    user    => 'root',
    path    => ['/usr/bin','/bin','/usr/sbin/'],
    unless  => 'grep physdev /etc/ufw/before.rules'
  } ~> Service['ufw']

  file_line {'bridge-nf-call-iptables':
    path => '/etc/sysctl.conf',
    line => 'net.bridge.bridge-nf-call-iptables = 0'
  }

  -> file_line {'bridge-nf-call-arptables':
    path => '/etc/sysctl.conf',
    line => 'net.bridge.bridge-nf-call-arptables = 0'
  }

  -> file_line {'bridge-nf-call-ip6tables':
    path => '/etc/sysctl.conf',
    line => 'net.bridge.bridge-nf-call-iptables = 0'
  }

  ~> exec{'/sbin/sysctl -p':
    user        => 'root',
    refreshonly => true
  }

  exec{'creating libvirtd group':
    command => 'addgroup libvirtd',
    user    => 'root',
    path    => ['/usr/bin','/bin','/usr/sbin/'],
    unless  => 'groups | grep libvirtd'
  }

  exec{"adding ${user} to libvirtd group":
    command => "usermod -G libvirtd  -a ${user}",
    user    => 'root',
    path    => ['/usr/bin','/bin','/usr/sbin/'],
    unless  => "groups ${user} | grep libvirtd"
  }

  ufw::interface {'virbr1': }
}
