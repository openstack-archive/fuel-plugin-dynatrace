$dynatrace = hiera('dynatrace')

if $dynatrace['enabled'] {
  class { 'ruxit_agent':
    user          => 'root',
    group         => 'root',
    ruxit_tenant  => $dynatrace('ruxit_tenant'),
    ruxit_token   => $dynatrace('ruxit_token'),
  }
}
