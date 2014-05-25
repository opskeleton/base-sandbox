# setting up kvm on Ubuntu
class kvm {

  $forward = '-I FORWARD -m physdev -physdev-is-bridged -j ACCEPT'

  package{['qemu-kvm', 'libvirt-bin', 'bridge-utils', 'virt-manager']:
    ensure  => present
  }  ~>

  exec{'forward bridge':
    command     => "/bin/sed -i '/^COMMIT/i ${forward}' /etc/ufw/before.rules",
    user        => 'root',
    refreshonly => true
  }

  file_line {'bridge-nf-call-iptables':
    path => '/etc/sysctl.conf',
    line => 'net.bridge.bridge-nf-call-iptables = 0'
  } ->

  file_line {'bridge-nf-call-arptables':
    path => '/etc/sysctl.conf',
    line => 'net.bridge.bridge-nf-call-arptables = 0'
  } ->

  file_line {'bridge-nf-call-ip6tables':
    path => '/etc/sysctl.conf',
    line => 'net.bridge.bridge-nf-call-iptables = 0'
  } ~>

  exec{'/sbin/sysctl -p':
    user         => 'root',
    refreshonly => true
  }
}
