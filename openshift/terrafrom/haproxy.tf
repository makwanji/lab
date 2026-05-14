resource "proxmox_virtual_environment_vm" "demo1-ha-proxy" {
  name      = "demo1-ha-proxy"
  node_name = "host1"

  clone {
    vm_id = 9000 # ocp-template VMID
  }

  cpu {
    cores = 1
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 512
  }

  disk {
    datastore_id = "local-lvm"
    size         = 30
    interface    = "ide1"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }
}
