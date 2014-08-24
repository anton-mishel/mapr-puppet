class maprsqoop {
require maprcore
$sqoop_version = '1.4.4'
$my_variable = hiera_hash(parameters)
$version=$my_variable['mapr-sqoop']

package { 'mapr-sqoop':
        ensure => $version,
      }

file { "/opt/mapr/hadoop/hadoop-0.20.2/lib/sqljdbc4.jar":
        mode =>   "755",
        owner  => "root",
        group  => "root",
        source => "puppet://dev-foreman.pontis.local/files/mapr/sqoop/sqljdbc4.jar",
	require => Package['mapr-sqoop']	
}

file { "/opt/mapr/sqoop/sqoop-$sqoop_version/conf":
    ensure => "directory",
    owner  => "mapr",
    group  => "mapr",
    mode   => 775,
    require => Package['mapr-sqoop']
}

file {'/opt/mapr/servicesconf/sqoop':
  ensure => file,
  content => "sqoop/sqoop-1.4.4/conf",
     } 
}
