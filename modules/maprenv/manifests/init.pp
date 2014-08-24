class maprenv  {
$my_variable = hiera_hash(parameters)
 $mysql=$my_variable['PONTIS_MYSQL_HOST']
 $hive_home=$my_variable['HIVE_HOME']
 $reduce_tasks=$my_variable['PONTIS_REDUCE_TASKS']
 $oozie_url=$my_variable['OOZIE_URL']
 $zookerpers=$my_variable['PONTIS_ZOOKEEPER_QUORUM']
 $umask=$my_variable['UMASK']
 
file {'/etc/profile.d/mapr.sh':
  ensure => file, 
  content => "export PONTIS_MYSQL_HOST=$mysql \nexport PONTIS_REDUCE_TASKS=$reduce_tasks \nexport HIVE_HOME=$hive_home \nexport OOZIE_URL=$oozie_url \nexport PONTIS_ZOOKEEPER_QUORUM=$zookerpers \numask $umask",
     }
}
