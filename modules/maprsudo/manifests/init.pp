class maprsudo {
  include sudo
   sudo::conf { 'mapr':
      priority => 1,
      content  => "mapr ALL=(ALL) NOPASSWD: ALL",
    }
}
