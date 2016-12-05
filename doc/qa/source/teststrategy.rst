Test Strategy
=============
Dynatrace Fuel plugin is a non-intrusive plugin for Fuel, that doesn't modify or replace any standard OpenStack service. It provides the Dynatrace monitoring solution for the OpenStack control plane services and also monitoring for the applications, if you choose to install Dynatrace in your workloads as well. The plugin installs the Dynatrace Security Gateway and the Dynatrace OneAgent. The goal of the tests is to ensure that the installation of the Dynatrace components was successful and that the OpenStack services work as intended. 

Acceptance Criteria
-------------------
All OSTF test should pass to ensure correct functionality of Fuel and the OpenStack cluster.

Test environment, infrastructure, and tools
-------------------------------------------
The plugin installs the Dynatrace OneAgent and the Dynatrace Security Gateway. The Dynatrace OneAgent runs on all major operating systems (see [1] for details). The Dynatrace Security Gateway should be installed on a dedicated physical or virtual machine. Find the requirements for the Dynatrace Security Gateway here [2].

To successfully operate Dynatrace, you also need a Dynatrace account with either a Dynatrace SaaS or Dynatrace Managed (on premise) environment. You can start a free trial [3] to setup a new environment or use your existing account. You will need the ID of your environment, the security token of your environment, and, if you use Dynatrace Managed, the IP address or domain name of the server where Dynatrace Managed is running for a successful setup of the Dynatrace OneAgent and the Dynatrace Security Gateway.

[1] Which environments and version does Dynatrace support?
https://help.dynatrace.com/get-started/welcome/which-environments-and-versions-does-dynatrace-support/

[2] Requirements for the Dynatrace Security Gateway?
https://help.dynatrace.com/get-started/install/how-do-i-install-dynatrace-security-gateway/

[3] Start 30-day free Dynatrace trial
https://www.dynatrace.com/trial/

Product compatibility matrix
----------------------------
Dynatrace plugin is developed for Fuel 9.0/9.1. It works with all major operating systems (https://help.dynatrace.com/get-started/welcome/which-environments-and-versions-does-dynatrace-support/).
