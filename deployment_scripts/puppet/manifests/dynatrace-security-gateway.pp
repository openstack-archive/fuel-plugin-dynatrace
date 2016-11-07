$dynatrace = hiera('fuel-plugin-dynatrace')

$tenant = $dynatrace['dynatrace_tenant']
$token = $dynatrace['dynatrace_token']
$managed = $dynatrace['dynatrace_managed']
$server = $dynatrace['dynatrace_server']

$file = "/tmp/Dynatrace-Security-Gateway.sh"

if ($dynatrace['dynatrace_managed']) {
  $url = "https://${server}/e/${tenant}/installer/sg/unix/latest/${token}/${tenant}"
}
else {
  $url = "https://${tenant}.live.dynatrace.com/installer/sg/unix/latest/${token}"
}

notify {$url:} ->
notify {$file:} ->

download {'Download Dynatrace Security Gateway':
  uri  => $url,
  dest => $file
} ->

exec { 'install_security_gateway':
  command => "/bin/sh ${file}",
  path => $::path
}
