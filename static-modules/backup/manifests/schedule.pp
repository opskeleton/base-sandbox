# Schedule a backup job for daily/monthly periods.
define backup::schedule(
  $hour='',
  $monthday=undef,
  $type='duply',
) {

  $log = "/var/log/duply_${name}.log"

  # TODO support trickle
  # trickle -u 60 -s duply uranus-home-cadytis backup_verify_purge --force | sudo tee /var/log/duply_uranus-home-cadytis.log 2>&1
  cron { "${name}_duply_backup_cron":
    ensure   => present,
    command  =>  $type ? {
      'duply' => "duply ${name} backup_verify_purge --force > ${log} 2>&1"
    },
    user     => 'root',
    hour     => $hour,
    monthday => $monthday,
    require  => File["/etc/duply/${name}/conf"],
  }

}
