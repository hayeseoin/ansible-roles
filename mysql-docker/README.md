# mysql-docker

Deploy a MySQL database on Amazon Linux 2023 (al2023) using docker.

## Requirements

Amazon Linux 2023

## Overview

This role launches a MySQL database in AL2023 using Docker. The root password and db password are generated when first running this playbook and saved as facts to `/etc/ansible/facts/mysql.fact`. This fact is pulled in by the role.

## Role variables

| Variable                   | Default               | Description                                                                                   |
| -------------------------- | --------------------- | --------------------------------------------------------------------------------------------- |
| mysql_version              | "8.0"                 | Sets the version. Must be either 8.0 or 8.4                                                   |
| mysql_app_database         | "app-database"        | Database to create when playbook is run                                                       |
| mysql_app_user             | "app-db-user"         | User created and given full access to `mysql_db_name`                                         |

## Example Playbook

```yaml
- hosts: all
  roles:
    - role: mysql-doker
      vars:
        mysql_version: "8.0"
        mysql_app_database: 'app-database'
        mysql_app_user: 'app-db-user'
```
## Author

Eoin Hayes - @hayeseoin
