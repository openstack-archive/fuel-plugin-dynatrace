class dynatrace::security_gateway {
  $file = "/tmp/Dynatrace-Security-Gateway.sh"

  if ($dynatrace::managed) {
    $url = "https://${dynatrace::server}/e/${dynatrace::tenant}/installer/sg/unix/latest/${dynatrace::token}/${dynatrace::tenant}"
  }
  else {
    $url = "https://${dynatrace::tenant}.live.dynatrace.com/installer/sg/unix/latest/${dynatrace::token}"
  }

  file { '/etc/hiera/plugins/dynatrace.yaml':
    ensure => file,
  } ->

  download {'Download Dynatrace Security Gateway':
    uri  => $url,
    dest => $file
  } ->

  exec { 'install_security_gateway':
    command => "/bin/sh ${file}",
    path => $::path
  }
}
