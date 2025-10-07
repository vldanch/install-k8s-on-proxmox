# Kubernetes Installation on Proxmox VMs using Terraform and Ansible

This repository automates the deployment of a Kubernetes cluster on virtual machines running on Proxmox VE using **Terraform** and **Ansible**.

## What this repository does

🔧 **Terraform**:

* Provisions virtual machines in Proxmox VE according to the defined inventory.

⚙️ **Ansible**:

* Installs and configures a Kubernetes cluster (control-plane and worker nodes).
* Sets up basic networking and dependencies for Kubernetes.

📁 Repository structure:

* `terraform/` — Terraform configurations for creating VMs in Proxmox.
* `inventory/` — Inventory with IP addresses and host details.
* `playbooks/` — Main Ansible playbooks for Kubernetes installation.
* `roles/` — Ansible roles for Kubernetes setup and dependencies.
* `k8s/` — Kubernetes manifests and configuration files.

## Video tutorial

📺 Watch the full installation tutorial on YouTube (in Russian):
👉 [WATCH VIDEO](https://www.youtube.com/watch?v=hi6LTgqBWmU)

*(If the video is not ready yet, you can update this link later.)*

## Requirements

* Proxmox VE with API access
* Terraform >= 1.0
* Ansible >= 2.10
* SSH access to the hosts
* A compatible OS image (e.g., Ubuntu 22.04) uploaded to Proxmox

## Quick start

```bash
cd terraform/proxmox
terraform init
terraform apply
```

## Support

☕ Support my work on coffee: [https://donate.stream/donate_68625552be6ba](https://donate.stream/donate_68625552be6ba)

## Contact

For questions or support, you can reach me on Telegram: [https://t.me/vldanch](https://t.me/vldanch)

---

## Additional setup commands (from video)

After running Terraform and creating the virtual machines, you can follow these commands as shown in the video:

```bash
sudo openvpn --config you_config.ovpn

sed -i 's/target_node = "target_node"/target_node = "you_proxmox_datacenter_node"/g' k8s-master.tf k8s-workers.tf
sed -i 's/ssh_user/user/g' k8s-master.tf k8s-workers.tf

cat terraform/proxmox/k8s-* | grep ip=1

ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u user -i inventory/proxmox/hosts playbooks/dev/k8s.yml --tags docker-ce
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/proxmox/hosts playbooks/dev/k8s.yml --tags cri-o
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory/proxmox/hosts playbooks/dev/k8s.yml --limit kubemaster --tags kubernetes-geerlingguy-init-master

JOIN_CMD=$(ansible kubemaster -i inventory/proxmox/hosts -u ssh_user -m command -a "kubeadm token create --print-join-command" | grep -o "kubeadm join.*")
JOIN_CMD="$JOIN_CMD --cri-socket=unix:///var/run/crio/crio.sock"
ansible-playbook -i inventory/proxmox/hosts playbooks/dev/k8s.yml \
  --limit kubeworker \
  --tags kubernetes-geerlingguy-init-worker \
  -e "kubernetes_join_command='$JOIN_CMD'"
```