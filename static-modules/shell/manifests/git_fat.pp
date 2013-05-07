# Setting up https://github.com/jedbrown/git-fat
class shell::git_fat {
  include downloadfile
  $home = hiera('home')

  downloadfile::and_md5check { 'git-fat':
      url    => 'https://raw.github.com/jedbrown/git-fat/master/git-fat',
      dest   => "${$home}/bin/git-fat",
      md5sum => '653bfbb3069a7d227806919487ecb0a4',
      user   => hiera('user'), 
      group  => hiera('user'),
      chmod  => '770',
  }
}
