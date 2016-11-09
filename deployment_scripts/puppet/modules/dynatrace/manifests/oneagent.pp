class dynatrace::oneagent {
  $file = "/tmp/Dynatrace-OneAgent.sh"

  if ($dynatrace::managed) {
    $url = "https://${dynatrace::server}/e/${dynatrace::tenant}/installer/agent/unix/latest/${dynatrace::token}/${dynatrace::tenant}"
  }
  else {
    $url = "https://${dynatrace::tenant}.live.dynatrace.com/installer/agent/unix/latest/${dynatrace::token}"
  }

  file { '/etc/hiera/plugins/dynatrace.yaml':
    ensure => file,
  } ->

  download {'Download Dynatrace OneAgent':
    uri  => $url,
    dest => $file
  } ->

  exec { 'install_oneagent':
    command => "/bin/sh ${file} APP_LOG_CONTENT_ACCESS=1",
    path => $::path
  }
}
