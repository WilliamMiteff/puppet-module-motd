# == Class: motd
#
# Module to manage motd
#
class motd (

) {
  #$banner =$::role ? {
  #  'puppetmaster' => 'Puppet Master',
  #  'webserver'    => 'Web Server',
  #  default        => 'some node',
  #}
  case $::role {
    'puppetmaster': {
      $msg = 'Puppet Master - test'
    }
    'webserver': {
      $msg = 'Web Server'
    }
    default: {
      fail('I am only meant to work on puppetmasters and webservers.')
    }
  }

  file { '/etc/motd':
    ensure  => file,
  ###source => 'puppet:///modules/motd/phooey',
    content => $msg,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
