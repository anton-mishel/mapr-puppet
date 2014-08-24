class maprnodepackages {
require system::yumrepos
package { 'sysstat':
        ensure => latest,
      } 
package { 'clustershell':
        ensure => latest,
      }
package { 'nmap':
        ensure => latest,
      }
package { 'iftop':
        ensure => latest,
      }
package { 'iotop':
        ensure => latest,
      }
package { 'strace':
        ensure => latest,
      }
package { 'screen':
        ensure => latest,
      }
package { 'lsof':
        ensure => latest,
      }
package { 'rsync':
        ensure => latest,
      }
}
