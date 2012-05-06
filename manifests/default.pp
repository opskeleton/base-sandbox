# vagrant box seems to miss this group
group{ 'puppet': ensure  => present }

$username = 'vagrant'
$scm_user = 'narkisr'
$scm_email = 'narkisr@gmail.com'

include git
include zsh
include oh_my_zsh
include local_security
include build_essential
include z
