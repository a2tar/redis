class redis::config (
  $ip             = '127.0.0.1',
  $port           = 6379,
  $unixsocket     = '/var/run/redis/redis.sock',
  $unixsocketperm = 777,
  $loglevel       = notice,
  $maxmemory      = '4Gb',
  $ensure         = present,
) {
  include redis::install
  include redis::service

  file { "redis.conf" :
    path    => "/etc/redis/redis.conf",
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template("redis/redis.conf.erb"),
    require => Class["redis::install"],
    notify  => Class["redis::service"],
  }

}