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
