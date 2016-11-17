
=========================
Fuel Plugin for Dynatrace
=========================

Dynatrace plugin for Fuel provides enterprise monitoring for your OpenStack
environment and for the application that run on top.

It uses Fuel pluggable architecture.
The plugin must be compatible with the version 9.0 of Mirantis OpenStack and the latest version of Dynatrace.

Problem description
===================

Proposed change
===============

Implement a Fuel plugin which will deploy the Dynatrace OneAgent to controller nodes and setup the Dynatrace
Security Gateway.

Alternatives
------------

Manual installation of the Dynatrace OneAgent and the Dynatrace Security Gateway.

Data model impact
-----------------

REST API impact
---------------

Upgrade impact
--------------

Fuel currently supports upgrading of Fuel Master node, so it is necessary to
install a new version of plugin which supports new Fuel release.

Security impact
---------------

Notifications impact
--------------------

Other end user impact
---------------------

Dynatrace plugin uses Fuel pluggable architecture.
After it is installed, the user can enable the plugin on the Setting tab of the Fuel web UI
and customize plugins settings.

Performance Impact
------------------

Other deployer impact
---------------------

Developer impact
----------------

Implementation
==============

Assignee(s)
-----------

Primary assignee:

- Dirk Wallerstorfer <dirk.wallerstorfer@dynatrace.com> - feature lead, developer


Project manager:

- Karolina Ruszkowska <karolina.ruszkowska@dynatrace.com>

Work Items
----------

* Create pre-dev environment and manually deploy Dynatrace software
* Create Fuel plugin bundle, which contains deployments scripts, puppet modules and metadata
* Implement puppet module with the following functions:

 - Allow configuration of Dynatrace components
 - Install Dynatrace OneAgent to controller nodes
 - Install Dynatrace Security Gateway to node

* Test Dynatrace plugin
* Create Documentation


Dependencies
============

* Fuel 9.0 and higher

Testing
=======

* Sanity checks including plugin build
* Syntax check
* Functional testing
* Non-functional testing (Destructive and Negative)

Documentation Impact
====================

* Deployment Guide (how to prepare an env for installation, how to install the plugin, how to deploy OpenStack env with the plugin)
* User Guide (which features the plugin provides, how to use them in the deployed OS env)
* Test Plan
* Test Report

References
==========
