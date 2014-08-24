class maprcore {
require maprjdk
require system::yumrepos
require pontisusers

$my_variable = hiera_hash(parameters)
$version_core=$my_variable['mapr-core']
$version_fileserver=$my_variable['mapr-fileserver']
	  
package { 'mapr-core':
        ensure => $version_core,
        }

package { 'mapr-fileserver':
        ensure => $version_fileserver,
      }


}
