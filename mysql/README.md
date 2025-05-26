# mysql

**Version: 0.7.0**

An Ansible to install and manage MySQL 8.0 or 8.4 on RHEL 9. 

It will automatically add a new password to `/root/.my.cnf`, allowing passwordless access via `sudo mysql`.

> This role does **not support downgrading** from MySQL 8.4 to 8.0.  

> It is designed for **fresh test systems** — if MySQL was previously installed, the initialization may fail.

Tested on **AL2023** and **AlmaLinux 9**.

## Requirements

None

## Role variables


| Variable                   | Default               | Description                                                                                   |
| -------------------------- | --------------------- | --------------------------------------------------------------------------------------------- |
| mysql_version              | "8.4"                 | Sets the version. Must be either 8.0 or 8.4                                                   |
| mysql_random_root_password | true                  | Sets a random root password at installation                                                   |
| mysql_root_password        | "VerySecurePassw0rd!" | Sets a password at startup, if mysql_random_root_password is not true                         |
| mysql_force_reinstall_repo | false                 | Reinstalls the repo. The repo installation step is normally skipped after first installation. |

## Example Playbook

```yaml
- hosts: all
  roles:
    - role: mysql
      vars:
        mysql_version: "8.0"
```
## Author

Eoin Hayes - @hayeseoin

---
notes:

 - Need to include a way of creating new users