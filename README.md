# Introduction

My full working environment including shell, vim and many other tools installation/configuration, designed to work only with Ubuntu 12.10.

# Usage

You can play with it using vagrant:

```bash
$ vagrant box add ubuntu-12.10_puppet-3 http://ubuntuone.com/7goAh5NodKGtCF0mgbThgb
$ vagrant up
$ vagrant ssh
$ cd /vagrant
$ sudo ./run.sh
```

In order to use it on your machine edit the manifest.pp default file and change user name and other details to match you own, then just:

```bash
$ sudo ./run.sh
```

# License

License GPLv3

Copyright (C) 2012 narkisr.com
