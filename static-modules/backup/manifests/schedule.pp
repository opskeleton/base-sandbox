# Schedule a backup job for daily/monthly periods.
class backup::schedule(
  $hour='',
  $monthday=undef,
  $type='duply',
  $backup_name=''
) {

  $log = "/var/log/duply_${backup_name}.log"

  cron { 'duply_backup_cron':
    ensure   => present,
    command  =>  $type ? {
      'duply' => "duply ${backup_name} backup_verify_purge --force > ${log} 2>&1"
    },
    user     => 'root',
    hour     => $hour,
    monthday => $monthday,
    require  => File["/etc/duply/${backup_name}/conf"],
  }

}
