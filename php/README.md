# PHP

An Ansible role to install PHP. 

> Notes:
> - Is tightly coupled to apache role, need to try and loosen this a bit
> - Installed default PHP for whatever repo. For example, 8.0 for Alma Linux, 8.4 for Amazon Linux 2023

## Requirements

Apache

## Overview

Installs either default PHP for the package manager, or a custom compiled PHP 7.4 created for legacy reasons. Not to be used in production.

## Role Variables


| Variable         | Default              | Description                                        |
| ---------------- | -------------------- | -------------------------------------------------- |
| php_version   | "7.4"          | Accepts "7.4" or "8.4" only. "8.4" will install the default PHP version for that distro                    |
| php_load_info   | true | When set to true, loads a default PHP info page at `localhost/info.php`             |

## Example Playbook

```yaml
- hosts: all
  roles:
    - role: mysql
      vars:
        php_version: "7.4"
```

## Author

Eoin Hayes - @hayeseoin