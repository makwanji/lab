resource "proxmox_virtual_environment_vm" "demo1-master-node1" {
  name      = "demo1-master-node1"
  node_name = "host1"

  clone {
    vm_id = 9000 # ocp-template VMID
  }

  cpu {
    cores = 4
  }

  memory {
    dedicated = 16384
  }

  disk {
    datastore_id = "local-lvm"
    size         = 100
    interface    = "scsi0"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

