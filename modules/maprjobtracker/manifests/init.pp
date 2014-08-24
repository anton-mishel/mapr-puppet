class maprjobtracker {
require maprcore
$my_variable = hiera_hash(parameters)
$version_jt=$my_variable['mapr-jobtracker']
$version_metrics=$my_variable['mapr-metrics']
		
package { 'mapr-jobtracker':
        ensure => $version_jt,
      }
#package { 'mapr-metrics':
#        ensure => $version_metrics,
#      }
}
