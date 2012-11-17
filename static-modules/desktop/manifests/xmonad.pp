# Setting up xomnad
class desktop::xmonad($home='',$username='') {
  $xmonad = "${home}/.xmonad"

  git::clone {$xmonad:
    url   => 'git://github.com/narkisr/xmonad-config.git',
    dst   => $xmonad,
    owner => $username
  }

  package{'xmonad':
    ensure  => present
  }

}
