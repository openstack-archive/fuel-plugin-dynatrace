Overview 
-------- 
Dynatrace is the innovator behind the industry’s premier
Digital Performance Platform. Gartner had recognized Dynatrace as APM leader 
now for 6 consecutive years. More than 8,000 customers trust Dynatrace. Our
experience and knowledge has been bundled to develop a new generation of
monitoring software. Dynatrace digital performance monitoring covers web scale
application environments down to each individual transaction – with no gaps
or blind spots – including front end, application performance, infrastructure,
containers, and cloud platforms, like OpenStack.

The Dynatrace Fuel plugin install the *Dynatrace OneAgent* on all controller
nodes and introduces a new node role called *Dynatrace Security 
Gateway*. In order to work properly you need an active Dynatrace account (free
trial also works) and access to your SaaS account or a Dynatrace Managed 
node/cluster on premise.

* Dynatrace OneAgent
The *Dynatrace OneAgent* is automatically installed on all controller nodes,
as soon as the plugin is activated. The OneAgent instruments the OpenStack 
services and also the supporting services like MySQL, RabbitMQ, Memcached, 
HAproxy, ... and sends all monitoring and log data to the node with 
*Dynatrace Security Gateway* role. 

* Dynatrace Security Gateway 
The *Dynatrace Security Gateway* role must be applied to a standalone physical
machine, where no other OpenStack service is running. If you plan to use 
Dynatrace for monitoring your applications that run on top of OpenStack as 
well, you need to make sure that the VMs where the Dynatrace OneAgent is 
installed have network access to the *Dynatrace Security Gateway* node.
