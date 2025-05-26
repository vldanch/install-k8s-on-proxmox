# To install MetalLB, apply the manifest:
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.9/config/manifests/metallb-native.yaml

# Setting the IP pool (example for the range 10.1.117.100-10.1.117.200)
cat <<EOF | kubectl apply -f -
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
    name: metallb-pool
    namespace: metallb-system
spec:
    addresses:
    - 10.1.117.100-10.1.117.200
EOF

# Setup protocol l2 advertisement
cat <<EOF | kubectl apply -f -
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
    name: l2-advert
    namespace: metallb-system
EOF

# Set variables for Kubernetes context and namespace
kube_context="kubernetes-admin@kubernetes"
kube_namespace="metallb-system" ; \
helm_chartname="metallb" ; \
helm upgrade \
    --kube-context ${kube_context} \
    --namespace ${kube_namespace} --create-namespace \
    --install ${helm_chartname} ./0.14.9 \
    --values ./0.14.9/values.yaml
