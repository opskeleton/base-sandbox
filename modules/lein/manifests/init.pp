# Class: lein
#
# This module manages lein see https://github.com/technomancy/leiningen
# Requires:
#  Java installed
# [Remember: No empty lines between comments and class definition]
class lein {

 $lein_url = "https://raw.github.com/technomancy/leiningen/preview/bin/lein"

 package{'openjdk-6-jdk':
   ensure  => present 
 }

 file{"$home/bin":
   ensure => directory,
   owner  => $username,
   group  => $username
 }

 exec{'lein fetch':
   command => "wget -P $home/bin $lein_url && chmod +x $home/bin/lein" ,
   user    => $username,
   path    => ['/usr/bin','/bin'],
   require => [File["$home/bin"], Package['openjdk-6-jdk']]
 }

 exec{"lein install":
   command  => "/bin/su - $username $home/bin/lein",
   require  => Exec['lein fetch']
 }

}
