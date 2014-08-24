class maprhiveserver2 {
require maprcore
require maprhive
$my_variable = hiera_hash(parameters)
$version=$my_variable['mapr-hiveserver2']

	  
package { 'mapr-hiveserver2':
        ensure => $version,
        }

}
