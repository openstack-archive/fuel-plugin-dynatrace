$dynatrace = hiera('dynatrace')

if $dynatrace['enabled'] {
  class {'ruxit_agent':}
}
