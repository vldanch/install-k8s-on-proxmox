# Set the kubeconfig path
export KUBECONFIG=$HOME/.kube/config

# Set variables for Kubernetes context and namespace
kube_context="kubernetes-admin@kubernetes"
kube_namespace="harbor" ; \
helm_chartname="harbor" ; \
helm upgrade \
    --kube-context ${kube_context} \
    --namespace ${kube_namespace} --create-namespace \
    --install ${helm_chartname} ./2.13.0 \
    --values ./2.13.0/values.yaml
