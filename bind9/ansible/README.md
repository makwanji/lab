# Local DNS Server - Absible

Setup a Ubuntu VM/Container and run this playbook to install required software.

## Run this script

`cd bind9/ansible`

## Playbook - create user

```bash
# Install bind9
ansible-playbook ./playbook/user.yml -l bind9 -u root --private-key ~/.ssh/id_rsa -e "ansible_user=root"
```

## Playbook - bind9

```bash
# Install bind9
ansible-playbook ./playbook/bind9.yml -l bind9
```
