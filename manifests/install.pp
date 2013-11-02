class redis::install (
  $ensure  = 'installed',
  $package = 'redis-server',
){
  include apt
  apt::ppa { "ppa:chris-lea/redis-server": } ->
  package { $package :
      ensure   => $ensure,
      require => Exec[apt_update],
  }
}
