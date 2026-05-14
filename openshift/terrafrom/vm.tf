resource "proxmox_virtual_environment_vm" "demo1-master-node1" {
  name      = "demo1-master-node1"
  node_name = "host1"

  clone {
    vm_id = 9000 # ocp-template VMID
  }

  cpu {
    cores = 4
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 16384
  }

  disk {
    datastore_id = "local-lvm"
    size         = 100
    interface    = "ide1"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}


resource "proxmox_virtual_environment_vm" "demo1-master-node2" {
  name      = "demo1-master-node2"
  node_name = "host3"

  clone {
    vm_id = 9001 # ocp-template VMID
  }

  cpu {
    cores = 4
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 16384
  }

  disk {
    datastore_id = "local-lvm"
    size         = 100
    interface    = "ide1"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

resource "proxmox_virtual_environment_vm" "demo1-master-node3" {
  name      = "demo1-master-node3"
  node_name = "host3"

  clone {
    vm_id = 9001 # ocp-template VMID
  }

  cpu {
    cores = 4
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 16384
  }

  disk {
    datastore_id = "local-lvm"
    size         = 100
    interface    = "ide1"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}
