class dynatrace {
  $dynatrace = hiera('dynatrace')

  $tenant = $dynatrace['dynatrace_tenant']
  $token = $dynatrace['dynatrace_token']
  $managed = $dynatrace['dynatrace_managed']
  $server = $dynatrace['dynatrace_server']
}
