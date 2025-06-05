# Ansibe role for Apache

Installs Apache on RHEL (Amazon Linux 2023).

> Notes:
> 
> - Should provide option to install or configre VHOSTS.
> - Need to enhance module installation and enabling.

## Overview

AL2023 doesn't include mod_ssl by default for some reason, so this playbook installs and configures that as well. 

Additional modules can be installed adding to the `apache_install_modules` list. Modules can be installed adding to the `apache_enable_modules` list.

## Role variables


| Variable         | Default              | Description                                        |
| ---------------- | -------------------- | -------------------------------------------------- |
| apache_install_modules   | ['mod_ssl']          | Ensures modules are installed. In this case mod_ssl (not default on AL2023)                     |
| openjdk_enable_modules   | ['speling'] | Ensures additional modules are installed. Can be used to enable optional modules like `speling` which are unlikely to cause a conflict with other files in `/etc/httpd/conf.modules.d/`             |

