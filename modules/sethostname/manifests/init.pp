class sethostname {
  file { "/etc/hosts":
    ensure => present,
    owner => root,
    group => root,
    mode => 644,
    content => "127.0.0.1       localhost.localdomain   localhost.localdomain   localhost4      localhost4.localdomain4 localhost\n$::ipaddress $::fqdn $::hostname\n",
  }
}
