System Test Scenarios
=====================

**Install plugin and deploy environment**

=============== =====
Test Case ID    install_plugin_deploy_env
--------------- -----
Steps           1. Install plugin using Fuel CLI, refer to the `Installation
                   Guide <http://docs.openstack.org/developer/fuel-docs/user
                   docs/fuel-install-guide/plugins/plugins_install_plugins.h
                   tml>`_
                #. Ensure plugin is successfully installed, as in the 
                   `Installation Guide <http://docs.openstack.org/developer/
                   fuel-docs/userdocs/fuel-install-guide/plugins/plugins_ins
                   tall_plugins.html>`_
                #. Create environment with enabled plugin in Fuel Web UI
                #. Add 3 controller nodes and apply the Dynatrace OneAgent 
                   role to all 3, 1 compute node, and 1 Dynatrace Security 
                   Gateway node
                #. Run network verification
                #. Deploy the cluster
                #. Verify there were no error messages during the deployment
                #. Run health check
--------------- -----
Expected Result Plugin is installed successfully. Dynatrace OneAgent is 
                installed on the controller nodes. Dynatrace Security 
                Gateway is setup successfully. All OSTF tests pass. 
                Environment is deployed successfully.
=============== =====

**Modifying environment with enabled plugin (remove/add controller nodes)**

=============== =====
Test Case ID    modify_env_with_plugin_remove_add_controller
--------------- -----
Steps           1. Install plugin using Fuel CLI, refer to the `Installation
                   Guide <http://docs.openstack.org/developer/fuel-docs/user
                   docs/fuel-install-guide/plugins/plugins_install_plugins.h
                   tml>`_
                #. Ensure plugin is successfully installed, as in the 
                   `Installation Guide <http://docs.openstack.org/developer/
                   fuel-docs/userdocs/fuel-install-guide/plugins/plugins_ins
                   tall_plugins.html>`_
                #. Create environment with enabled plugin in Fuel Web UI
                #. Add 3 controller nodes and apply the Dynatrace OneAgent 
                   role to all 3, 1 compute node, and 1 Dynatrace Security 
                   Gateway node
                #. Run network verification
                #. Deploy the cluster
                #. Verify there were no error messages during the deployment
                #. Run OpenStack health check
                #. Remove 1 controller node
                #. Redeploy the cluster
                #. Run health check
                #. Add 1 new controller node
                #. Redeploy the cluster
                #. Run health check
--------------- -----
Expected Result Plugin is installed successfully. Dynatrace OneAgent is 
                installed on the controller nodes. Dynatrace Security 
                Gateway is setup successfully. All OSTF tests pass. 
                Environment is deployed successfully. The environment is 
                redeployed successfully when adding/removing a controller
                node.
=============== =====

**Modifying environment with enabled plugin (remove/add compute nodes)**

=============== =====
Test Case ID    modify_env_with_plugin_remove_add_compute
--------------- -----
Steps           1. Install plugin using Fuel CLI, refer to the `Installation
                   Guide <http://docs.openstack.org/developer/fuel-docs/user
                   docs/fuel-install-guide/plugins/plugins_install_plugins.h
                   tml>`_
                #. Ensure plugin is successfully installed, as in the 
                   `Installation Guide <http://docs.openstack.org/developer/
                   fuel-docs/userdocs/fuel-install-guide/plugins/plugins_ins
                   tall_plugins.html>`_
                #. Create environment with enabled plugin in Fuel Web UI
                #. Add 3 controller nodes and apply the Dynatrace OneAgent 
                   role to all 3, 1 compute node, and 1 Dynatrace Security 
                   Gateway node
                #. Run network verification
                #. Deploy the cluster
                #. Verify there were no error messages during the deployment
                #. Run health check
                #. Add 1 compute node
                #. Redeploy the cluster
                #. Run health check
                #. Remove 1 compute node
                #. Redeploy the cluster
                #. Run health check
--------------- -----
Expected Result Plugin is installed successfully. Dynatrace OneAgent is 
                installed on the controller nodes. Dynatrace Security 
                Gateway is setup successfully. All OSTF tests pass. 
                Environment is deployed successfully. The environment is 
                redeployed successfully when adding/removing a compute
                node.
=============== =====

**Uninstall of plugin in the deployed environment**

=============== =====
Test Case ID    uninstall_plugin_with_deployed_env
--------------- -----
Steps           1. Install plugin using Fuel CLI, refer to the `Installation
                   Guide <http://docs.openstack.org/developer/fuel-docs/user
                   docs/fuel-install-guide/plugins/plugins_install_plugins.h
                   tml>`_
                #. Ensure plugin is successfully installed, as in the 
                   `Installation Guide <http://docs.openstack.org/developer/
                   fuel-docs/userdocs/fuel-install-guide/plugins/plugins_ins
                   tall_plugins.html>`_
                #. Create environment with enabled plugin in Fuel Web UI
                #. Add 3 controller nodes and apply the Dynatrace OneAgent 
                   role to all 3, 1 compute node, and 1 Dynatrace Security 
                   Gateway node
                #. Run network verification
                #. Deploy the cluster
                #. Verify there were no error messages during the deployment
                #. Run health check
                #. Uninstall the plugin with running
                   ``fuel plugins --remove <plugin-name>==<plugin_version>``
                #. Ensure that the following output appears in CLI: 
                   *"400 Client Error: Bad Request (Can't delete 
                   plugin           which is enabled for some environment.)"*
--------------- -----
Expected Result Plugin is installed successfully. Dynatrace OneAgent is 
                installed on the controller nodes. Dynatrace Security 
                Gateway is setup successfully. All OSTF tests pass. 
                Environment is deployed successfully. An alert is 
                displayed when trying to uninstall the plugin.
=============== =====

**Uninstall of plugin in the non-deployed environment**

=============== =====
Test Case ID    uninstall_plugin
--------------- -----
Steps           1. Install plugin using Fuel CLI, refer to the `Installation
                   Guide <http://docs.openstack.org/developer/fuel-docs/user
                   docs/fuel-install-guide/plugins/plugins_install_plugins.h
                   tml>`_
                #. Ensure plugin is successfully installed, as in the 
                   `Installation Guide <http://docs.openstack.org/developer/
                   fuel-docs/userdocs/fuel-install-guide/plugins/plugins_ins
                   tall_plugins.html>`_
                #. Create environment with enabled plugin in Fuel Web UI
                #. Add 3 controller nodes and apply the Dynatrace OneAgent 
                   role to all 3, 1 compute node, and 1 Dynatrace Security 
                   Gateway node
                #. Run network verification
                #. Delete listed environment
                #. Uninstall the plugin with running
                   ``fuel plugins --remove <plugin-name>==<plugin_version>``
--------------- -----
Expected Result Plugin is installed successfully. The cluster is created and
                network verification is passed. The plugin is enabled and 
                configured in the Fuel Web UI. When uninstalling the plugin,
                no plugin-related elements are left in the environment (e.g.
                UI elements disappear, Nailgun database is restored to the 
                default state, no output for command "fuel plugins --list").
=============== =====





