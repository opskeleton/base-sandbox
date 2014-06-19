# Introduction

My full working environment including shell, vim and many other tools installation/configurations, designed to work only with Ubuntu 14.04

[![Build Status](https://travis-ci.org/narkisr/puppet-base-env.png)](https://travis-ci.org/narkisr/puppet-base-env)

# Usage

You can play with it using vagrant:

```bash
$ cd puppet-base-env
$ librarian-puppet install 
$ vagrant up
$ vagrant ssh
$ cd /vagrant
$ sudo ./run.sh
```

## In order to use it on your machine: 

On machine with RVM:

```bash
# edit to match your own settings
$ vi hieradata/physical.yaml
$ librarian-puppet install
$ sudo ./run.sh
```

On a barebone machines:
```bash
$ gem install bundle
$ bundle install 
$ librarian-puppet install
$ sudo ./run.sh
```

# License

License GPLv3

Copyright (C) 2012 narkisr.com
