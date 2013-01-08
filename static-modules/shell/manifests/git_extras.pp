# Setting up git extras https://github.com/visionmedia/git-extras
class shell::git_extras {
  $dest = '/tmp/git-extras'

  git::clone {'git-extras':
    url   => 'git://github.com/visionmedia/git-extras.git',
    dst   => $dest,
    owner => $username
  }

  exec{'installing git-extras':
    command => "make DESTDIR=${home} PREFIX=",
    user    => 'root',
    path    => ['/usr/bin','/bin'],
    cwd     => $dest,
    require => Git::Clone['git-extras'],
    unless  => "test -f ${home}/bin/git-extras"
  }

}
