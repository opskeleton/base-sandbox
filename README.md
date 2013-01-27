# Introduction

My full working environment including shell, vim and many other tools installation/configurations, designed to work only with Ubuntu 12.10.

# Usage

You can play with it using vagrant:

```bash
$ cd puppet-base-env
$ librarian-puppet install 
$ vagrant box add ubuntu-12.10_puppet-3 http://ubuntuone.com/7goAh5NodKGtCF0mgbThgb
$ vagrant up
$ vagrant ssh
$ cd /vagrant
$ sudo ./run.sh
```

In order to use it on your machine: 

```bash
# edit to match your own settings
$ vi hieradata/physical.yaml
$ sudo ./run.sh
```

# License

License GPLv3

Copyright (C) 2012 narkisr.com
