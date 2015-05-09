node default {
  include monitoring::collectd
  include monitoring::sensu::client
}
