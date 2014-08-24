class maprpig {
require maprcore
$pig_version = '0.12'

$my_variable = hiera_hash(parameters)
$version=$my_variable['mapr-pig']
		
package { 'mapr-pig':
        ensure => $version,
      } 
file { "/opt/mapr/pig/pig-$pig_version/conf":
    ensure => "directory",
    owner  => "mapr",
    group  => "mapr",
    mode   => 775,
    require => Package['mapr-pig']
}

}
