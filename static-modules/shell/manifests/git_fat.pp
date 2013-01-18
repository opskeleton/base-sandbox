# Setting up https://github.com/jedbrown/git-fat
class shell::git_fat {
  include downloadfile
  $home = hiera('home')

  downloadfile::and_md5check { 'git-fat':
      url    => 'https://raw.github.com/jedbrown/git-fat/master/git-fat',
      dest   => "${$home}/bin/git-fat",
      md5sum => 'de2c66d07e7523ded7629fc0197423bd',
      user   => hiera('user'), 
      group  => hiera('user'),
      chmod  => '770',
  }
}
