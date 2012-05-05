# vagrant box seems to miss this group
group{ 'puppet': ensure  => present }

$username = 'vagrant'

include git
include zsh
include oh_my_zsh
