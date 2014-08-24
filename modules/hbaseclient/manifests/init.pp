class hbaseclient {
require maprclient
$hbasepkgs = [ "mapr-hbase","mapr-hbase-internal" ]
package { $hbasepkgs: ensure => "installed",
}

}
