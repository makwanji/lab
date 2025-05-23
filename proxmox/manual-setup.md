
## Update DNS
```bash
sudo tee <<EOF /etc/resolv.conf >/dev/null
# google-dns
nameserver 8.8.8.8
options edns0 trust-ad
search .
EOF
```
## Install vim
```bash
sudo apt update -y && sudo apt install vim -y
```


## Configure IP for the VM

```bash
sudo tee <<EOF /etc/netplan/01-network-manager-all.yaml >/dev/null
---
network:
  version: 2
  renderer: networkd
  ethernets:
    ens18:
      dhcp4: no
      addresses:
        - 192.168.2.56/24
      routes:
        - to: default
          via: 192.168.2.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
EOF

sudo chmod 600 /etc/netplan/01-network-manager-all.yaml
sudo netplan try

# remove
sudo rm /etc/netplan/50-cloud-init.yaml

# # scp ./config/ip-traffiq.yml ubuntu@192.168.2.108:/etc/netplan/01-network-manager-all.yaml
# cat ./config/ip-traffiq.yml | ssh ubuntu@192.168.2.108 "sudo tee -a "
# sudo netplan try
# ansible -i 192.168.2.108, -b -m copy -a "src=./config/ip-traffiq.yml dest=/etc/netplan/01-network-manager-all.yaml" all

```