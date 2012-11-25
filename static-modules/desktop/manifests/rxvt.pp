# Setting up rxvt terminal
class desktop::rxvt {
  package{['xclip','rxvt-unicode-256color']:
    ensure  => present
  }

  dots::link_dot{'.Xdefaults':}

  git::clone {'monaco-powerline-font':
    url   => 'git://gist.github.com/4140912.git',
    dst   => "${home}/.fonts/Monaco_Linux-Powerline",
    owner => $username
  }



}
