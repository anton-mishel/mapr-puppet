class maprzookeeper {
require system::yumrepos
require maprjdk
require maprcore

$my_variable = hiera_hash(parameters)
$version=$my_variable['mapr-zookeeper']

package { 'mapr-zookeeper':
        ensure => $version,
      } 
}
