class maprwebserver {
require system::yumrepos
require maprjdk
require maprcore
$my_variable = hiera_hash(parameters)
$version_web=$my_variable['mapr-webserver']
$version_metrics=$my_variable['mapr-metrics']	

package { 'mapr-webserver':
        ensure => $version_web,
      }
package { 'mapr-metrics':
        ensure => $version_metrics,
      }
}
