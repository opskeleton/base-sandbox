# Setting up xmonad
class desktop::xmonad {
  $xmonad = "${desktop::home}/.xmonad"

  git::clone {$xmonad:
    url   => 'git://github.com/narkisr/xmonad-config.git',
    dst   => $xmonad,
    owner => $desktop::user
  }

  package{['xmonad','xubuntu-desktop']:
    ensure  => present
  }

  exec{'xmonad --recompile':
    user        => 'root',
    path        => ['/usr/bin','/bin'],
    creates     => "${xmonad}/xmonad.o",
    environment => "HOME=${desktop::home}",
    require     => [Package['xmonad'], Git::Clone[$xmonad]]
  }
}
