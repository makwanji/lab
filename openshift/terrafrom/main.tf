terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">= 2.9.11"
    }
  }

  backend "local" {
    path = "./terraform.tfstate"
  }
}

provider "proxmox" {
  pm_api_url      = "https://192.168.2.31:8006/api2/json"
  pm_api_token_id = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "demo1-master-node1" {
  name        = "demo1-master-node1"
  target_node = "host1"
  clone       = "ubuntu240402"
  os_type     = "cloud-init"

  cores       = 4
  sockets     = 1
  memory      = 16384
  disk {
    size      = "100G"
    type      = "scsi"
    storage   = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}

resource "proxmox_vm_qemu" "demo1-master-node2" {
  name        = "demo1-master-node2"
  target_node = "host3"
  clone       = "ubuntu240402"
  os_type     = "cloud-init"

  cores       = 4
  sockets     = 1
  memory      = 16384
  disk {
    size      = "100G"
    type      = "scsi"
    storage   = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}

resource "proxmox_vm_qemu" "demo1-master-node3" {
  name        = "demo1-master-node3"
  target_node = "host3"
  clone       = "ubuntu240402"
  os_type     = "cloud-init"

  cores       = 4
  sockets     = 1
  memory      = 16384
  disk {
    size      = "100G"
    type      = "scsi"
    storage   = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}

resource "proxmox_vm_qemu" "demo1-worker-node1" {
  name        = "demo1-worker-node1"
  target_node = "host1"
  clone       = "ubuntu240402"
  os_type     = "cloud-init"

  cores       = 2
  sockets     = 1
  memory      = 8192
  disk {
    size      = "100G"
    type      = "scsi"
    storage   = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}

resource "proxmox_vm_qemu" "demo1-worker-node2" {
  name        = "demo1-worker-node2"
  target_node = "host1"
  clone       = "ubuntu240402"
  os_type     = "cloud-init"

  cores       = 2
  sockets     = 1
  memory      = 8192
  disk {
    size      = "100G"
    type      = "scsi"
    storage   = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}

resource "proxmox_vm_qemu" "demo1-worker-node3" {
  name        = "demo1-worker-node3"
  target_node = "host1"
  clone       = "ubuntu240402"
  os_type     = "cloud-init"

  cores       = 2
  sockets     = 1
  memory      = 8192
  disk {
    size      = "100G"
    type      = "scsi"
    storage   = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}

resource "proxmox_vm_qemu" "demo1-worker-node4" {
  name        = "demo1-worker-node4"
  target_node = "host1"
  clone       = "ubuntu240402"
  os_type     = "cloud-init"

  cores       = 2
  sockets     = 1
  memory      = 8192
  disk {
    size      = "100G"
    type      = "scsi"
    storage   = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}

resource "proxmox_vm_qemu" "demo1-worker-node5" {
  name        = "demo1-worker-node5"
  target_node = "host1"
  clone       = "ubuntu240402"
  os_type     = "cloud-init"

  cores       = 2
  sockets     = 1
  memory      = 8192
  disk {
    size      = "100G"
    type      = "scsi"
    storage   = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}

resource "proxmox_vm_qemu" "demo1-worker-node6" {
  name        = "demo1-worker-node6"
  target_node = "host1"
  clone       = "ubuntu240402"
  os_type     = "cloud-init"

  cores       = 2
  sockets     = 1
  memory      = 8192
  disk {
    size      = "100G"
    type      = "scsi"
    storage   = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}
