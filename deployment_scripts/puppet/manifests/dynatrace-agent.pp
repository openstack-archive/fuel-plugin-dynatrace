notice('MODULAR: dynatrace/dynatrace-agent.pp')

include dynatrace
class { 'dynatrace::oneagent': }
