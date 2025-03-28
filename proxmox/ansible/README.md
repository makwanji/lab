# Ansible script

## Run this script

`cd lab/proxmox/ansible`

## Playbook - traefik

```bash
# Ping connection
ansible-playbook ./playbook/ping.yml -l docker,traefik-vm

# Update software
ansible-playbook ./playbook/update-pkg.yml -l docker,traefik-vm

# Install traefik
ansible-playbook ./playbook/update-hostname.yml -l traefik-vm
ansible-playbook ./playbook/traefik-install.yml -l traefik-vm
ansible-playbook ./playbook/traefik-manage.yml -l traefik-vm
```


## Playbook - docker vm

```bash
# Ping connection
ansible-playbook ./playbook/ping.yml -l docker
ansible-playbook ./playbook/update-hostname.yml -l docker
ansible-playbook ./playbook/docker-install.yml -l docker
```

