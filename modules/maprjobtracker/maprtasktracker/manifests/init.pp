class maprtasktracker {
require system::yumrepos
require maprjdk
require maprcore
package { 'mapr-tasktracker':
        ensure => latest,
      } 
}
