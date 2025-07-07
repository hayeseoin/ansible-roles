# mysql-docker

Deploy a MySQL database on Amazon Linux 2023 (al2023) using docker.

## Requirements

None

## Overview

This role launches a MySQL database in AL2023 using Docker. The root password and db password are generated when first running this playbook and saved as facts to `/etc/ansible/facts/mysql.fact`. This fact is pulled in by the role.

This also adds an alias to the remote host to connect to the database. `db-connect` will automatically connect to the database. This is possible because the playbook also writes the password to `/home/ec2-user/.my.cnf` for passwordless login. 

This has only been tested with AL2023, but it could work on any DNF system which can install docker with `sudo dnf install docker`. 

## Role variables

| Variable                   | Default               | Description                                                                                   |
| -------------------------- | --------------------- | --------------------------------------------------------------------------------------------- |
| mysql_version              | "8.0"                 | Sets the version. Must be either 8.0 or 8.4                                                   |
| mysql_app_database         | "app-database"        | Database to create when playbook is run                                                       |
| mysql_app_user             | "app-db-user"         | User created and given full access to `app-database`                                          |
| mysql_docker_user          | "ec2-user"            | User given access to docker - on AL2023 should usually be `ec2-user`                          |


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
