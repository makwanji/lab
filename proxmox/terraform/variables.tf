variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
  sensitive   = true
}

variable "pm_api_token_id" {
  description = "Proxmox API Token ID"
  type        = string
  sensitive   = true
}

variable "pm_api_token" {
  description = "Proxmox API Token"
  type        = string
  sensitive   = true
}

variable "pm_tls_insecure" {
  description = "Disable TLS certificate verification"
  type        = bool
  default     = true
}

variable "target_node" {
  description = "Target Proxmox node name"
  type        = string
  default     = "pve"
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory in MB"
  type        = number
  default     = 2048
}

variable "swap" {
  description = "Swap memory in MB"
  type        = number
  default     = 512
}

variable "rootfs_size" {
  description = "Root filesystem size"
  type        = string
  default     = "10G"
}

variable "ostemplate" {
  description = "OS template to use (e.g., local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst)"
  type        = string
  default     = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

variable "storage" {
  description = "Storage location"
  type        = string
  default     = "local-lvm"
}

variable "bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "nameserver" {
  description = "DNS nameserver"
  type        = string
  default     = "8.8.8.8"
}

variable "search_domain" {
  description = "DNS search domain"
  type        = string
  default     = "home.mylab.com"
}

variable "unprivileged" {
  description = "Run container in unprivileged mode"
  type        = bool
  default     = true
}

variable "ssh_public_keys" {
  description = "SSH public keys to add to containers"
  type        = list(string)
  default     = []
}

variable "ct_core_vmid" {
  description = "VM ID for ct-core container"
  type        = number
  default     = 100
}

variable "ct_core_ip" {
  description = "IP address for ct-core container"
  type        = string
  default     = "192.168.1.100/24"
}

variable "ct_core_hwaddr" {
  description = "Hardware MAC address for ct-core"
  type        = string
  default     = "02:06:88:00:00:00"
}

variable "ct_github_vmid" {
  description = "VM ID for ct-github container"
  type        = number
  default     = 101
}

variable "ct_github_ip" {
  description = "IP address for ct-github container"
  type        = string
  default     = "192.168.1.101/24"
}

variable "ct_github_hwaddr" {
  description = "Hardware MAC address for ct-github"
  type        = string
  default     = "02:06:88:00:00:01"
}
