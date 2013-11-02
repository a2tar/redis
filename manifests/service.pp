class redis::service {
  service { "redis-server":
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class["redis::install"],
  }
}
