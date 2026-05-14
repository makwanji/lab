# terraform {
#   required_providers {
#     proxmox = {
#       source  = "Telmate/proxmox"
#       version = "2.9.11"
#     }
#   }
# }


provider "proxmox" {
  endpoint  = var.pm_api_url
  api_token = var.pm_api_token
  insecure  = true
}
