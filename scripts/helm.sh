# Sealed Secrets
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets

# kube-prometheus-stack
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# Add kubernetes-dashboard repository
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/

# Nvidia
helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
helm repo add rancher-latest https://releases.rancher.com/server-charts/latest
helm repo add rancher-stable https://releases.rancher.com/server-charts/stable
helm repo add traefik https://traefik.github.io/charts

# Deploy a Helm Release named "kubernetes-dashboard" using the kubernetes-dashboard chart
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard

# - matchExpressions:
#                   - key: nvidia.com/gpu.present
#                     operator: In
#                     values:
#                       - 'true'
