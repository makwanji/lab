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
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "ocp-master1" {
  name        = "ocp-master1"
  target_node = "host1"
  clone       = "ubuntu240402"
  os_type     = "cloud-init"

  cores       = 2
  sockets     = 1
  memory      = 4096
  disk {
    size      = "20G"
    type      = "scsi"
    storage   = "local-lvm"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

}
