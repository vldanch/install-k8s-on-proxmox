terraform {
  required_providers {
    proxmox = {
        source = "telmate/proxmox"
        version = "3.0.1-rc6"
    }
  }
}
provider "proxmox" {
  pm_api_url   = var.proxmox_api_url
  pm_user      = var.proxmox_user
  pm_password  = var.proxmox_password
  pm_tls_insecure = true
}
