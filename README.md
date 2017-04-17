# Introduction

A base environment for servers, development, backup and many more, based on top of Ubuntu-16.04/FreeBSD-11 integrating a large collection of modules from [pulling-strings](https://github.com/pulling-strings).

Check the manifests folder for usage examples.

[![Build Status](https://travis-ci.org/opskeleton/base-sandbox.png)](https://travis-ci.org/opskeleton/base-sandbox)

# Usage

Create the development environment within Vagrant:

```bash
$ ./boot.sh
```

## In order to use it on your machine: 

```bash
# edit to match your own settings
$ vi hieradata/physical.yaml
$ librarian-puppet install
$ sudo ./run.sh
```

## Prerequisite

For Development:

* Vagrant 1.8.x
* Ubuntu 16.x box with puppet 3.8.7 (or FreeBSD-11)
* RVM

For Deployment:

* Puppet 3.8.7
* Ubuntu 16.04

# Copyright and license

Copyright [2017] [Ronen Narkis]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
