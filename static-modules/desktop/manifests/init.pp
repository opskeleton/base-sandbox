# setting up a desktop installation
class desktop($username='',$home='') {

  if($desktop::is_desktop == 'true'){

    include virtualbox
    include desktop::misc
    include desktop::tor

    class{'desktop::xmonad':
      home     => hiera('home'),
      username => hiera('user')
    }

    package{'gparted':
      ensure  => present
    }
  }
}
