
class pgpool::common {

   $pgpool_package = "pgpool2"
   $pgpool_service = "pgpool2"

   $pgpool_default = "/etc/default/pgpool"
   $pgpool_default_wrong = "/etc/default/pgpool2"

   $pgpool_conf    = "/etc/pgpool.conf"
   $pgpool_hba     = "/etc/pool_hba.conf"

   # Package 

   package { "${pgpool_package}":
      ensure => installed,
   }


   # Service

   service { "${pgpool_service}":
      require => Package["${pgpool_package}"],
   }


   # Files

   file { "${pgpool_default}":
      ensure => present,
      mode   => "644",
      notify => Service["${pgpool_service}"],
   }

   file { "${pgpool_default_wrong}":
      ensure => absent,
   }

   file { "${pgpool_conf}":
      ensure => present,
      mode   => "644",
      notify => Service["${pgpool_service}"],
   }

   file { "${pgpool_hba}":
      ensure => present,
      mode   => "644",
      notify => Service["${pgpool_service}"],
   }

}


