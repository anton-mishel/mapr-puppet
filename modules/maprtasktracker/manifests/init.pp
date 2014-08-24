class maprtasktracker {
require maprcore
$my_variable = hiera_hash(parameters)
$version=$my_variable['mapr-tasktracker']
		
package { 'mapr-tasktracker':
        ensure => $version,
      }
}
