class maprjdk {
require system::yumrepos
package { "java-1.7.0-openjdk":
    ensure => "purged"
}
package { "java-1.6.0-openjdk":
    ensure => "purged"
}
package { 'jdk.x86_64':
        ensure => installed,
      } 
file {'/etc/profile.d/java.sh':
        ensure  => file,
        owner   => 'root',
        content => "export JAVA_HOME=/usr/java/default" # Template from a module
      }
file { '/usr/bin/java':
   ensure => 'link',
   target => '/usr/java/default/bin/java',
}
}
