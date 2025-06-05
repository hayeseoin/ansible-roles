# OpenJDK 11

An Ansible role to install OpenJDK 11 on RHEL

> Notes:
>
> - This role is currently a wrapper around an install script. This should be made 'ansible native'
> - Role should probably be called `openjdk11` or else implement logic to install any openjdk

## Overview

This role orchestrates a shell script to install OpenJDK 11. It relies on a manually maintained internal manifest.

## Role Variables


| Variable         | Default              | Description                                        |
| ---------------- | -------------------- | -------------------------------------------------- |
| openjdk_version   | 11.0.27           | Version of openjdk11 to install. See [`vars/manifest.yml`](vars/manifest.yml) for supported versions.                     |
| openjdk_java_home   | "/opt/java" | The symlink location to Java Home                |

## Author

Eoin Hayes - @hayeseoin