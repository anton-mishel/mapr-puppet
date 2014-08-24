class pontisntp  {
$my_variable = hiera_hash(parameters)
 $server1=$my_variable['NTP_SERVER1']
 $server2=$my_variable['NTP_SERVER2']
class { 'ntp':
 servers => [ '$server1' , '$server2' ],
 package_name    => 'ntp',
 package_ensure  => latest,
 service_ensure  => running,
 service_enable  => true,
 }
}
