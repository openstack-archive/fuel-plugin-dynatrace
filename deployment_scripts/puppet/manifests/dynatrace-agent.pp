$dynatrace = hiera('fuel-plugin-dynatrace')

$tenant = $dynatrace['dynatrace_tenant']
$token = $dynatrace['dynatrace_token']
$managed = $dynatrace['dynatrace_managed']
$server = $dynatrace['dynatrace_server']

$file = "/tmp/Dynatrace-OneAgent.sh"

if ($managed) {
  $url = "https://${server}/e/${tenant}/installer/agent/unix/latest/${token}/${tenant}"
}
else {
  $url = "https://${tenant}.live.dynatrace.com/installer/agent/unix/latest/${token}"
}

download {'Download Dynatrace OneAgent':
  uri  => $url,
  dest => $file
} ->

exec { 'install_oneagent':
  command => "/bin/sh ${file} APP_LOG_CONTENT_ACCESS=1",
  path => $::path
}
