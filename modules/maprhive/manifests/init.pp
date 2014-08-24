class maprhive {
require maprcore
$hive_version = 0.12
$my_variable = hiera_hash(parameters)
$version=$my_variable['mapr-hive']

package { 'mapr-hive':
        ensure => $version,
        
      }
file { "/opt/mapr/hive/hive-$hive_version/conf":
    ensure => "directory",
    owner  => "mapr",
    group  => "mapr",
    mode   => 775,
    require => Package['mapr-hive']
}
file { "/opt/mapr/hive/hive-0.12/lib/mysql-connector-java-5.1.26-bin.jar":
        mode =>   "755",
        owner  => "mapr",
        group  => "mapr",
        source => "puppet://dev-foreman.pontis.local/files/mapr/hive/mysql-connector-java-5.1.26-bin.jar",
        require => Package['mapr-hive']
}

file {'/opt/mapr/servicesconf/hive':
  ensure => file,
  content => "hive/hive-0.12/conf",
     }

}

