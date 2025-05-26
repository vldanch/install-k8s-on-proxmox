proxmox:
# Set the kubeconfig path
export KUBECONFIG=$HOME/.kube/config

# Set variables for Kubernetes context and namespace
kube_context="kubernetes-admin@kubernetes"
kube_namespace="ingress-internal" ; \
helm_chartname="ingress-nginx" ; \
helm upgrade \
    --kube-context ${kube_context} \
    --namespace ${kube_namespace} --create-namespace \
    --install ${kube_namespace}-${helm_chartname} ./4.12.1 \
    --values ./4.12.1/values.yaml
