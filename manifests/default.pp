# vagrant box seems to miss this group
group{ 'puppet': ensure  => present }

include git
