variable "proxmox_api_url" {
  type        = string
  description = "The URL endpoint for the Proxmox Virtual Environment API (e.g., https://host:port)"
}

variable "proxmox_user" {
  type        = string
  description = "The username for the Proxmox Virtual Environment API (e.g., root@pam)"
}

variable "proxmox_password" {
  type        = string
  description = "Password for the Proxmox Virtual Environment API user"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for authenticating with VMs (e.g., ssh-rsa ...)"
  sensitive   = true
}
