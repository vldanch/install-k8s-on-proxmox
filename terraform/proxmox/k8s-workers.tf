resource "proxmox_vm_qemu" "k8s-worker-node1-test-ansible" {
    name = "k8s-worker-node1-test-ansible"
    desc = "A test for using terraform and cloudinit"

    # Node name has to be the same name as within the cluster
    # this might not include the FQDN
    target_node = "target_node"

    # The template name to clone this vm from
    clone = "Ubuntu2204-Template"

    # Activate QEMU agent for this VM
    agent = 1

    os_type = "cloud-init"
    cores = 2
    sockets = 2
    vcpus = 2
    cpu_type = "host"
    memory = 2048
    scsihw = "virtio-scsi-single"

    # Setup the disk
    disks {
        ide {
            ide3 {
                cloudinit {
                    storage = "vgSSD"
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    size            = "20G"
                    storage         = "vgSSD"
                    replicate       = true
                }
            }
            # New disk (for example, 50 GB)
            virtio1 {
                disk {
                    size            = "50G"
                    storage         = "vgSSD"
                    replicate       = true
                }
            }
        }
    }

    # Setup the network interface and assign a vlan tag: 256
    network {
        id      = 0  # or another unique identifier for the network interface
        model   = "virtio"
        bridge  = "vmbr0"
    }

    # Setup the ip address using cloud-init.
    boot = "order=virtio0"
    # Keep in mind to use the CIDR notation for the ip.
    ipconfig0 = "ip=10.1.117.61/24,gw=10.1.117.1"
    # ipconfig0 = "ip=dhcp"
    sshkeys = var.ssh_public_key
    nameserver = "8.8.8.8"
    ciuser = "ssh_user"
}

resource "proxmox_vm_qemu" "k8s-worker-node2-test-ansible" {
    name = "k8s-worker-node2-test-ansible"
    desc = "A test for using terraform and cloudinit"

    # Node name has to be the same name as within the cluster
    # this might not include the FQDN
    target_node = "target_node"

    # The template name to clone this vm from
    clone = "Ubuntu2204-Template"

    # Activate QEMU agent for this VM
    agent = 1

    os_type = "cloud-init"
    cores = 2
    sockets = 2
    vcpus = 2
    cpu_type = "host"
    memory = 2048
    scsihw = "virtio-scsi-single"

    # Setup the disk
    disks {
        ide {
            ide3 {
                cloudinit {
                    storage = "vgSSD"
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    size            = "20G"
                    storage         = "vgSSD"
                    replicate       = true
                }
            }
            # New disk (for example, 50 GB)
            virtio1 {
                disk {
                    size            = "50G"
                    storage         = "vgSSD"
                    replicate       = true
                }
            }
        }
    }

    # Setup the network interface and assign a vlan tag: 256
    network {
        id      = 0  # or another unique identifier for the network interface
        model   = "virtio"
        bridge  = "vmbr0"
    }

    # Setup the ip address using cloud-init.
    boot = "order=virtio0"
    # Keep in mind to use the CIDR notation for the ip.
    ipconfig0 = "ip=10.1.117.62/24,gw=10.1.117.1"
    # ipconfig0 = "ip=dhcp"
    sshkeys = var.ssh_public_key
    nameserver = "8.8.8.8"
    ciuser = "ssh_user"
}

resource "proxmox_vm_qemu" "k8s-worker-node3-test-ansible" {
    name = "k8s-worker-node3-test-ansible"
    desc = "A test for using terraform and cloudinit"

    # Node name has to be the same name as within the cluster
    # this might not include the FQDN
    target_node = "target_node"

    # The template name to clone this vm from
    clone = "Ubuntu2204-Template"

    # Activate QEMU agent for this VM
    agent = 1

    os_type = "cloud-init"
    cores = 2
    sockets = 2
    vcpus = 2
    cpu_type = "host"
    memory = 2048
    scsihw = "virtio-scsi-single"

    # Setup the disk
    disks {
        ide {
            ide3 {
                cloudinit {
                    storage = "vgSSD"
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    size            = "20G"
                    storage         = "vgSSD"
                    replicate       = true
                }
            }
            # New disk (for example, 50 GB)
            virtio1 {
                disk {
                    size            = "50G"
                    storage         = "vgSSD"
                    replicate       = true
                }
            }
        }
    }

    # Setup the network interface and assign a vlan tag: 256
    network {
        id      = 0  # or another unique identifier for the network interface
        model   = "virtio"
        bridge  = "vmbr0"
    }

    # Setup the ip address using cloud-init.
    boot = "order=virtio0"
    # Keep in mind to use the CIDR notation for the ip.
    ipconfig0 = "ip=10.1.117.63/24,gw=10.1.117.1"
    # ipconfig0 = "ip=dhcp"
    sshkeys = var.ssh_public_key
    nameserver = "8.8.8.8"
    ciuser = "ssh_user"
}

resource "proxmox_vm_qemu" "k8s-worker-node4-test-ansible" {
    name = "k8s-worker-node4-test-ansible"
    desc = "A test for using terraform and cloudinit"

    # Node name has to be the same name as within the cluster
    # this might not include the FQDN
    target_node = "target_node"

    # The template name to clone this vm from
    clone = "Ubuntu2204-Template"

    # Activate QEMU agent for this VM
    agent = 1

    os_type = "cloud-init"
    cores = 2
    sockets = 2
    vcpus = 2
    cpu_type = "host"
    memory = 2048
    scsihw = "virtio-scsi-single"

    # Setup the disk
    disks {
        ide {
            ide3 {
                cloudinit {
                    storage = "vgSSD"
                }
            }
        }
        virtio {
            virtio0 {
                disk {
                    size            = "20G"
                    storage         = "vgSSD"
                    replicate       = true
                }
            }
            # New disk (for example, 50 GB)
            virtio1 {
                disk {
                    size            = "50G"
                    storage         = "vgSSD"
                    replicate       = true
                }
            }
        }
    }

    # Setup the network interface and assign a vlan tag: 256
    network {
        id      = 0  # or another unique identifier for the network interface
        model   = "virtio"
        bridge  = "vmbr0"
    }

    # Setup the ip address using cloud-init.
    boot = "order=virtio0"
    # Keep in mind to use the CIDR notation for the ip.
    ipconfig0 = "ip=10.1.117.64/24,gw=10.1.117.1"
    # ipconfig0 = "ip=dhcp"
    sshkeys = var.ssh_public_key
    nameserver = "8.8.8.8"
    ciuser = "ssh_user"
}