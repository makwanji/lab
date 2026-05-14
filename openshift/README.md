# OpenShift Multi node Installation

## Host Configuration

| ProxMox host | VM | IP Address | CPU (Core) | Memory (MB) | Disk |
| --- | --- | --- | --- | --- | --- |
| host1 | demo1-master-node1 | 192.168.2.41 | 4 | 16384 | 100 |
| host3 | demo1-master-node2 | 192.168.2.42 | 4 | 16384 | 100 |
| host3 | demo1-master-node3 | 192.168.2.43 | 4 | 16384 | 100 |
| host1 | demo1-worker-node1 | 192.168.2.44 | 2 | 8192 | 100 |
| host1 | demo1-worker-node2 | 192.168.2.45 | 2 | 8192 | 100 |
| host1 | demo1-worker-node3 | 192.168.2.46 | 2 | 8192 | 100 |
| host1 | demo1-worker-node4 | 192.168.2.47 | 2 | 8192 | 100 |
| host1 | demo1-worker-node5 | 192.168.2.48 | 2 | 8192 | 100 |
| host1 | demo1-worker-node6 | 192.168.2.49 | 2 | 8192 | 100 |

## Create container HAProxy

## Create Teamplate

```bash
# Create VM
qm create 9000 --name ocp-template --memory 4096 --cores 2 --net0 virtio,bridge=vmbr0

# Attech ISO
qm set 9000 --ide2 local:iso/openshift.iso,media=cdrom

# Create VM Disk
qm set 9000 --scsi0 local-lvm:32

# Set BootOrder
qm set 9000 --boot order=ide2

# Start VM
qm set 9000 --boot order=ide2

# Cleanup VM
sudo cloud-init clean
sudo truncate -s 0 /etc/machine-id
sudo rm -f /var/lib/dbus/machine-id
sudo poweroff

# Convert VM to Template
qm template 9000

#Copy template - Export disk from host1
qm config 9000

#Copy template - copy disk manually
vzdump 9000 --mode stop --compress zstd --dumpdir /root

#Copy template - SCP
scp /root/vzdump-qemu-9000-*.vma.zst root@host3:/root/

# ssh
ssh 192.168.2.34

#Copy template - Restore on host3
qmrestore /root/vzdump-qemu-9000-*.vma.zst 9001 --storage local-lvm


# remote iso
qm set 9001 --delete ide2
```

## Create VM's in Proxmox

```bash
# Terraform plan
terraform plan -out=openshift.tfplan

# Terrafrom apply
terraform apply "openshift.tfplan"

```

### Change IP Address manually

```bash

# check setup
sudo nmcli con show

# Setup IP
sudo nmcli con mod "Wired connection 1" \
ipv4.addresses 192.168.2.42/24 \
ipv4.gateway 192.168.2.1 \
ipv4.method manual

# Apply changes
sudo nmcli con down "Wired connection 1" && sudo nmcli con up "Wired connection 1"
```

## ProxMox command

### Delete VM

```bash
qm destroy 107 --purge 1 --destroy-unreferenced-disks 1
qm destroy 123 --purge 1 --destroy-unreferenced-disks 1
qm destroy 124 --purge 1 --destroy-unreferenced-disks 1
qm destroy 125 --purge 1 --destroy-unreferenced-disks 1
qm destroy 126 --purge 1 --destroy-unreferenced-disks 1

qm destroy 132 --purge 1 --destroy-unreferenced-disks 1
qm destroy 135 --purge 1 --destroy-unreferenced-disks 1


qm destroy 128 --purge 1 --destroy-unreferenced-disks 1
qm destroy 129 --purge 1 --destroy-unreferenced-disks 1
qm destroy 130 --purge 1 --destroy-unreferenced-disks 1

```
