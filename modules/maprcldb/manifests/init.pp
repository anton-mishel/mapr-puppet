class maprcldb {
require system::yumrepos
require maprjdk
require maprcore

$my_variable = hiera_hash(parameters)
$version=$my_variable['mapr-cldb']

package { 'mapr-cldb':
        ensure => $version,
      }
	  
}
