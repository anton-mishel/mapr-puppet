class maprclient {
package { "mapr-client":
    ensure => "installed"
}

exec { "maprClientInstall":
        command => "/opt/mapr/server/configure.sh -N Hadoopon -c -C 172.30.1.30:7222,172.30.1.31:7222,172.30.1.33:7222",
        onlyif => "/bin/rpm -qa | grep mapr-client",
}

}
