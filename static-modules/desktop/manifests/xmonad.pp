# Setting up xmonad
class desktop::xmonad($home='',$username='') {
  $xmonad = "${home}/.xmonad"

  git::clone {$xmonad:
    url   => 'git://github.com/narkisr/xmonad-config.git',
    dst   => $xmonad,
    owner => $username
  }

  package{['xmonad','xubuntu-desktop']:
    ensure  => present
  }

  exec{'xmonad --recompile':
    user    => 'root',
    path    => ['/usr/bin','/bin'],
    creates => "${xmonad}/xmonad.o",
    environment => "HOME=${home}",
    require => [Package['xmonad'], Git::Clone[$xmonad]]
  }
}
