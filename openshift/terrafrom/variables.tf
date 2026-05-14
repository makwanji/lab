variable "proxmox_api_token_id" {
  type        = string
  description = "Proxmox API Token ID (format: username@realm!tokenname)"
  sensitive   = true
}

variable "proxmox_api_token_secret" {
  type        = string
  description = "Proxmox API Token Secret"
  sensitive   = true
}
