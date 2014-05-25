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
}
