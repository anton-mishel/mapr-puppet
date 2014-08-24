class pontisanalytics {
require maprcore
$my_variable = hiera_hash(parameters)
$project_name=$my_variable['PROJECT_NAME']  #Take an integration kit project name from Global Parameters 
$lock_exist=$my_variable['ANALYTICS_INSTALL_LOCK']
$maprclass = hiera_hash(classes) 
$kill_command = "for x in `/opt/mapr/oozie/oozie-3.3.2/bin/oozie jobs -jobtype coordinator -filter 'status=RUNNING;status=PREP;status=RUNNINGWITHERROR'| grep mapr-C| awk '{print $1}'` ; do /opt/mapr/oozie/oozie-3.3.2/bin/oozie job -kill  $x ; done"

if $lock_exist == 'true' {
      fail ('Foreman lock installation lock is active .')
                         }
else {
  

 if 'maproozie' in $maprclass 
 {
  notify {'OOZIE IS INSTALLED':}

 exec { 'Kill all oozie Jobs':
    command   => $kill_command, 
    provider  => 'shell',
    user      => 'pontis',
  }
package { 'pontis-analytics':
        ensure => 'latest',
        }

package { "pontis-analytics-$project_name":
        ensure => 'latest',
        }
exec{ 'Run  install_to_maprfs.sh script':
    command   => '/opt/pontis/analytics-app/default/bin/install_to_maprfs.sh',
    provider  => 'shell',
    user      => 'pontis',
  }

exec{ 'Trigger Pull Central Config':
    command   => '/opt/mapr/server/pullcentralconfig true',
    provider  => 'shell',
  }

exec{ 'Submit Oozie Jobs':
    command   => '/opt/pontis/analytics-app/default/bin/submit_oozie.sh pontis-hive-aggregations;/opt/pontis/analytics-app/default/bin/submit_oozie.sh pontis-hive-export-mntr_process_status;/opt/pontis/analytics-app/default/bin/submit_oozie.sh pontis-hive-facts;/opt/pontis/analytics-app/default/bin/submit_oozie.sh pontis-hive-logs;/opt/pontis/analytics-app/default/bin/submit_oozie.sh pontis-hive-metadata;/opt/pontis/analytics-app/default/bin/submit_oozie.sh pontis-hive-panels;/opt/pontis/analytics-app/default/bin/submit_oozie.sh pontis_map_reduce',
    provider  => 'shell',
    user      => 'pontis',      
  }


 }

 else {
  notify {'OOZIE IS NOT INSTALLED':}

package { 'pontis-analytics':
        ensure => 'latest',
        }

package { "pontis-analytics-$project_name":
        ensure => 'latest',
        }
exec{ 'Trigger Pull Central Config':
    command   => '/opt/mapr/server/pullcentralconfig true',
    provider  => 'shell',
  }

     }
}
}
