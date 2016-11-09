notice('MODULAR: dynatrace/dynatrace-security-gateway.pp')

include dynatrace
class { 'dynatrace::security_gateway': }
