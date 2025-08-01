# Kubernetes Installation on Proxmox VMs using Terraform and Ansible

This repository automates the deployment of a Kubernetes cluster on virtual machines running on Proxmox VE using **Terraform** and **Ansible**.

## What this repository does

🔧 **Terraform**:
- Provisions virtual machines in Proxmox VE according to the defined inventory.

⚙️ **Ansible**:
- Installs and configures a Kubernetes cluster (control-plane and worker nodes).
- Sets up basic networking and dependencies for Kubernetes.

📁 Repository structure:
- `terraform/` — Terraform configurations for creating VMs in Proxmox.
- `inventory/` — Inventory with IP addresses and host details.
- `playbooks/` — Main Ansible playbooks for Kubernetes installation.
- `roles/` — Ansible roles for Kubernetes setup and dependencies.
- `k8s/` — Kubernetes manifests and configuration files.

## Video tutorial

📺 Watch the full installation tutorial on YouTube (in Russian):  
👉 [WATCH VIDEO](https://www.youtube.com/watch?v=hi6LTgqBWmU)

*(If the video is not ready yet, you can update this link later.)*

## Requirements

- Proxmox VE with API access
- Terraform >= 1.0
- Ansible >= 2.10
- SSH access to the hosts
- A compatible OS image (e.g., Ubuntu 22.04) uploaded to Proxmox

## Quick start

```bash
cd terraform/proxmox
terraform init
terraform apply
```