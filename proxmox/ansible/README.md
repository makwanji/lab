# Ansible script

## Playbook

```bash
# Ping connection
ansible-playbook ./playbook/ping.yml -l docker,traefik-vm

# Update software
ansible-playbook ./playbook/update-pkg.yml -l docker,traefik-vm

# Install traefik
ansible-playbook ./playbook/update-hostname.yml -l traefik-vm
ansible-playbook ./playbook/install-traefik.yml -l traefik-vm
ansible-playbook ./playbook/manage-traefik.yml -l traefik-vm
```
