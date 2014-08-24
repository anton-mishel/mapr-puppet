class maprnfs {
require maprcore
$my_variable = hiera_hash(parameters)
$version=$my_variable['mapr-nfs']
		
package { 'mapr-nfs':
        ensure => $version,
      }
}
