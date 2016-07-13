$dynatrace = hiera('fuel-plugin-dynatrace')

class { 'ruxit_agent':
  user          => 'fueladmin',
  group         => 'fueladmin',
  ruxit_tenant  => $dynatrace['dynatrace_tenant'],
  ruxit_token   => $dynatrace['dynatrace_token'],
}
