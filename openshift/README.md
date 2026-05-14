# OpenShift Multi node Installation

## Host Configuration

| ProxMox host | VM | IP Address | CPU (Core) | Memory (MB) | Disk |
| --- | --- | --- | --- | --- | --- |
| host1 | demo1-master-node1 | 192.168.2.41 | 4 | 16384 | 100 |
| host3 host | demo1-master-node2 | 192.168.2.42 | 4 | 16384 | 100 |
| host3 | demo1-master-node3 | 192.168.2.43 | 4 | 16384 | 100 |
| host1 | demo1-worker-node1 | 192.168.2.44 | 2 | 8192 | 100 |
| host1 | demo1-worker-node2 | 192.168.2.45 | 2 | 8192 | 100 |
| host1 | demo1-worker-node3 | 192.168.2.46 | 2 | 8192 | 100 |
| host1 | demo1-worker-node4 | 192.168.2.47 | 2 | 8192 | 100 |
| host1 | demo1-worker-node5 | 192.168.2.48 | 2 | 8192 | 100 |
| host1 | demo1-worker-node6 | 192.168.2.49 | 2 | 8192 | 100 |

## Create VM's in Proxmox

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
