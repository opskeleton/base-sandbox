# vagrant box seems to miss this group
group{ 'puppet': ensure  => present }

# when not used within vagrant context this should be set to the main user
$username = 'vagrant'
$scm_user = 'narkisr'
$scm_email = 'narkisr@gmail.com'
$home = "/home/$username"

include git
include shell
include local_security
include build_essential
include vim-configuration
include langs
include gradle
include lein
