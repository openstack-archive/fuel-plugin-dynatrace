Installation Guide
------------------
This guide assumes that you have installed Fuel and all the nodes of your
future environment are discovered and functional.

Install Dynatrace Plugin
''''''''''''''''''''''''
1. Download the Dynatrace plugin from the `Fuel Plugins Catalog
<https://software.mirantis.com/download-mirantis-openstack-fuel-plug-ins/>`_.
2. Copy the rpm package downloaded at the previous step to the Fuel Master
node.

 ``scp fuel-plugin-dynatrace-1.0-1.0.0-1.noarch.rpm``

3. Log into the Fuel Master node and install the plugin.

 ``ssh <the Fuel Master node ip>``

 ``fuel plugins --install fuel-plugin-dynatrace-1.0-1.0.0-1.noarch.rpm``

4. You should get the following output:

 ``Plugin <plugin-name-version>.rpm was successfully installed``

Configure Dynatrace Plugin
''''''''''''''''''''''''''
1. First, you need to create an environment in Fuel web UI.
2. Select *Install Dynatrace* in the *Additional Services* screen to be able
 to assign the *Dynatrace* role to nodes.
3. Enable the plugin and fill the configuration fields with correct values
of your Dynatrace environment (Settings > Other > Dynatrace).

 - Dynatrace Environment ID: your Dynatrace environment ID
 - Dynatrace Token: your Dynatrace environment token

4. Add nodes and assign the *Dynatrace* role to all nodes. Sample node
configuration is provided below. [IMAGE]

5. Finish the configuration according to your requirements.

6. Press *Deploy changes* to deploy the environment.