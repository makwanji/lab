terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "~> 2.9"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token
  pm_tls_insecure     = var.pm_tls_insecure
}

# CT Core Container
resource "proxmox_lxc" "ct_core" {
  target_node = var.target_node
  hostname    = "ct-core"
  ostype      = "ubuntu"
  ostemplate  = var.ostemplate
  vmid        = var.ct_core_vmid

  # Resource allocation
  cores  = var.cores
  memory = var.memory
  swap   = var.swap

  # Rootfs configuration
  rootfs {
    storage = var.storage
    size    = var.rootfs_size
  }

  # Network configuration
  network {
    name   = "eth0"
    hwaddr = var.ct_core_hwaddr
    ip     = var.ct_core_ip
    bridge = var.bridge
  }

  nameserver   = var.nameserver
  searchdomain = var.search_domain

  unprivileged = var.unprivileged

  # SSH keys for root user
  ssh_public_keys = join("\n", var.ssh_public_keys)

  onboot = true

  tags = "core"
}

# CT GitHub Container
resource "proxmox_lxc" "ct_github" {
  target_node = var.target_node
  hostname    = "ct-github"
  ostype      = "ubuntu"
  ostemplate  = var.ostemplate
  vmid        = var.ct_github_vmid

  # Resource allocation
  cores  = var.cores
  memory = var.memory
  swap   = var.swap

  # Rootfs configuration
  rootfs {
    storage = var.storage
    size    = var.rootfs_size
  }

  # Network configuration
  network {
    name   = "eth0"
    hwaddr = var.ct_github_hwaddr
    ip     = var.ct_github_ip
    bridge = var.bridge
  }

  nameserver   = var.nameserver
  searchdomain = var.search_domain

  unprivileged = var.unprivileged

  # SSH keys for root user
  ssh_public_keys = join("\n", var.ssh_public_keys)

  onboot = true

  tags = "github"
}

output "ct_core_ip" {
  description = "IP address of ct-core container"
  value       = var.ct_core_ip
}

output "ct_github_ip" {
  description = "IP address of ct-github container"
  value       = var.ct_github_ip
}
