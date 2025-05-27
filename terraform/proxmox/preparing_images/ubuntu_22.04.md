# Preparing the image

# Source guide - https://gist.github.com/zidenis/dfc05d9fa150ae55d7c87d870a0306c5

# SSH to Proxmox Server
ssh user@your-proxmox-server
su - root

# Install required tools on Proxmox Server
apt update
apt install -y libguestfs-tools

# Install qemu quest agent on Ubuntu 22.04 Cloud Image
export IMAGES_PATH="/mnt/pve/shared_SAS/template/iso"

cd $IMAGES_PATH

wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

virt-customize --install qemu-guest-agent -a "${IMAGES_PATH}/jammy-server-cloudimg-amd64.img"

export QEMU_CPU_MODEL="host"
export VM_CPU_CORES=2
export VM_CPU_SOCKETS=2
export VM_MEMORY=4098
export VM_STORAGE_NAME="local-lvm"
export VM_BRIDGE_NAME="vmbr0"

export CLOUD_INIT_USER="CLOUD_INIT_USER"
export CLOUD_INIT_PASSWORD="CLOUD_INIT_PASSWORD"
# export CLOUD_INIT_SSHKEY="/home/user/.ssh/id_rsa.pub" # Provides the path to the SSH public key for the user.
export CLOUD_INIT_IP="dhcp"
# export CLOUD_INIT_IP="10.1.117.50/24,gw=10.1.117.1" # Static example
export CLOUD_INIT_NAMESERVER="8.8.8.8"
export CLOUD_INIT_SEARCHDOMAIN="domain.ru"

export TEMPLATE_ID=2001
#export TEMPLATE_ID=$(pvesh get /cluster/nextid)

export VM_NAME="Ubuntu2204"
export VM_DISK_IMAGE="${IMAGES_PATH}/jammy-server-cloudimg-amd64.img"

# Create VM. Change the cpu model 
qm create ${TEMPLATE_ID} --name ${VM_NAME} --cpu ${QEMU_CPU_MODEL} --sockets ${VM_CPU_SOCKETS} --cores ${VM_CPU_CORES} --memory ${VM_MEMORY} --numa 1 --net0 virtio,bridge=${VM_BRIDGE_NAME} --ostype l26 --agent 1 --scsihw virtio-scsi-single

# Import Disk
qm set ${TEMPLATE_ID} --virtio0 ${VM_STORAGE_NAME}:0,import-from=${VM_DISK_IMAGE}

# Add Cloud-Init CD-ROM drive. This enables the VM to receive customization instructions during boot.
qm set ${TEMPLATE_ID} --ide2 ${VM_STORAGE_NAME}:cloudinit --boot order=virtio0

# Cloud-init network-data
qm set ${TEMPLATE_ID} --ipconfig0 ip=${CLOUD_INIT_IP} --nameserver ${CLOUD_INIT_NAMESERVER} --searchdomain ${CLOUD_INIT_SEARCHDOMAIN}

# Cloud-init user-data
# qm set ${TEMPLATE_ID} --ciupgrade 1 --ciuser ${CLOUD_INIT_USER} --cipassword ${CLOUD_INIT_PASSWORD}
qm set ${TEMPLATE_ID} --ciuser ${CLOUD_INIT_USER} --cipassword ${CLOUD_INIT_PASSWORD}

# Cloud-init regenerate ISO image, ensuring that the VM will properly initialize with the desired parameters.
qm cloudinit update ${TEMPLATE_ID}

qm set ${TEMPLATE_ID} --name "${VM_NAME}-Template"

qm template ${TEMPLATE_ID}