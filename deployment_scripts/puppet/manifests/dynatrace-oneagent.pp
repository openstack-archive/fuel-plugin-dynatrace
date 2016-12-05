notice('MODULAR: dynatrace/dynatrace-oneagent.pp')

include dynatrace
class { 'dynatrace::oneagent': }
