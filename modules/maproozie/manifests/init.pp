class maproozie {
require maprcore
$my_variable = hiera_hash(parameters)
$version=$my_variable['mapr-oozie']
$version_internal=$my_variable['mapr-oozie-internal']

package { 'mapr-oozie':
        ensure => $version,
        }

package { 'mapr-oozie-internal':
        ensure => $version_internal, 
        }

file { "/opt/mapr/oozie/oozie-3.3.2/libext":
    ensure => "directory",
    owner  => "mapr",
    group  => "mapr",
    mode   => 755,
     }

file { "/opt/mapr/oozie/oozie-3.3.2/libext/mysql-connector-java-5.1.26-bin.jar":
        mode =>   "755",
        owner  => "mapr",
        group  => "mapr",
        source => "puppet://dev-foreman.pontis.local/files/mapr/oozie/mysql-connector-java-5.1.26-bin.jar",
}
file { "/var/tmp/ext-2.2.zip":
        mode =>   "755",
        owner  => "mapr",
        group  => "mapr",
        source => "puppet://dev-foreman.pontis.local/files/mapr/oozie/ext-2.2.zip",
}

exec { "refresh_cache":
    command => "/opt/mapr/oozie/oozie-3.3.2/bin/oozie-setup.sh prepare-war -extjs /var/tmp/ext-2.2.zip -jars /opt/mapr/oozie/oozie-3.3.2/libext/mysql-connector-java-5.1.26-bin.jar",
    path    => "/usr/local/bin/:/bin/:/opt/mapr/oozie/oozie-3.3.2/bin/",
}

service { "mapr-oozie":
  ensure => "running",
}
file {'/opt/mapr/servicesconf/oozie':
  ensure => file,
  content => "oozie/oozie-3.3.2/conf",
     }

}
