
node 'build.local' {
  include build
  include barbecue
  class{'jdk':
    version => 7
  }
}
