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


# Copyright and license

Copyright [2013] [Ronen Narkis]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
