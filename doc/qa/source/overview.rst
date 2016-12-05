Overview 
======== 
The Dynatrace Fuel plugin introduces two new node roles called *Dynatrace
OneAgent* and *Dynatrace Security Gateway*. In order to work properly you need
an active Dynatrace account (free trial also works) and access to your SaaS
account or a Dynatrace Managed node/cluster on premise.

* Dynatrace OneAgent
The *Dynatrace OneAgent* role must be applied to all nodes
in your environment that have the Controller role. The OneAgent instruments the
OpenStack services and also the supporting services like MySQL, RabbitMQ,
Memcached, HAproxy, ... and sends all monitoring and log data to the node with 
*Dynatrace Security Gateway* role. 

* Dynatrace Security Gateway 
The *Dynatrace Security Gateway* role must be
applied to a standalone physical machine, where no other OpenStack service is
running. If you plan to use Dynatrace for monitoring your applications that run
on top of OpenStack as well, you need to make sure that the VMs where the
Dynatrace OneAgent is installed have network access to the *Dynatrace Security
Gateway* node.

Developer's specification
-------------------------
https://github.com/Dynatrace/fuel-plugin-dynatrace/blob/master/specs/spec.rst

Limitations
-----------
Dynatrace Fuel plugin version 1.0.0 has been developed for Fuel 9.0/9.1.
