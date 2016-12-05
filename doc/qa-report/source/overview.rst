Document purpose
================

This document provides test results for system tests of Dynatrace Fuel Plugin 1.0.0 on Mirantis Fuel 9.0/9.1.

Test environment
================
A six node cluster made up of Dell Optiplex 7040 (4 cores, 16 GB memory, 256 GB storage)  was used for conducting the tests. Two networks were used during the tests.

- mgmt-pxe, used for: Admin(PXE) (untagged)
- trunk, used for: Management (VLAN101), Storage (VLAN102), Public (VLAN103), Private (VLAN104-110)

