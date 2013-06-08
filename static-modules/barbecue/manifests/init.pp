# == Class: barbecue
#
# Sets up the fpm barbecue repo
#
# === Examples
#
#  class { barbecue:  }
#
# === Authors
#
# Ronen Narkis <narkisr@gmail.com>
#
# === Copyright
#
# Copyright 2013 Ronen Narkis , unless otherwise noted.
#
class barbecue {
  if(!defined(Apt::Source['barbecue'])){
    $repo_url = 'http://celestial-ops.com/barbecue'
    $key_id = 'E29035F0'
    $key_server = 'http://keyserver.ubuntu.com:11371/pks'
    $key_url = "${key_server}/lookup?op=get&fingerprint=on&search=0x8B095396E29035F0"

    apt::key {'celestial':
      key        => $key_id,
      key_source => $key_url
    } ->

    apt::source { 'barbecue':
      location    => $repo_url,
      release     => 'quantal',
      repos       => 'main',
      key         => $key_id,
      key_source  => $key_url,
      include_src => false,
    }
  }
}
