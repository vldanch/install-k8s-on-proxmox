# Navigate to the directory containing OpenEBS configuration files
cd ~/Desktop/projects/install-k8s-by-customer

# Set the kubeconfig path
export KUBECONFIG=$HOME/.kube/config

# Set variables for Kubernetes context and namespace
kube_context="kubernetes-admin@kubernetes"
kube_namespace="openebs"
helm_chartname="openebs"
helm upgrade \
    --kube-context ${kube_context} \
    --namespace ${kube_namespace} --create-namespace \
    --install ${helm_chartname} ./3.10.0 \
    --values ./3.10.0/values.yaml

# Before applying the cStor configuration, list available block devices.
# Make sure to include them in the cstor.yaml file if necessary!!!
➜ ~ $ kubectl get blockdevice -n openebs
NAME                                           NODENAME                        SIZE          CLAIMSTATE   STATUS   AGE
blockdevice-1b55f9677bdb20dc617629db83279f7d   k8s-worker-node4-test-ansible   53686025728   Claimed      Active   45h
blockdevice-2495dc259c41b618dca216a7371f61dc   k8s-worker-node1-test-ansible   53686025728   Claimed      Active   45h
blockdevice-a2ff8b70640f6ec47571131d6fdb6a11   k8s-worker-node3-test-ansible   53686025728   Claimed      Active   45h
blockdevice-e3f80f4f2a1c42ef61cd4010c6216c94   k8s-worker-node2-test-ansible   53686025728   Claimed      Active   45h

# Apply the cStor configuration manifest
kubectl apply -f 3.10.0/cstor.yaml

# Create a StorageClass for cStor
kubectl apply -f 3.10.0/cstor-storageclass.yaml

# Create a test PersistentVolumeClaim (PVC) to verify cStor functionality
kubectl apply -f 3.10.0/openebs-pvc.yaml

# Apply a deployment that uses the PVC
kubectl apply -f 3.10.0/deployment.yaml

# Create a test pod that uses the created PVC
kubectl apply -f 3.10.0/test-pod.yaml