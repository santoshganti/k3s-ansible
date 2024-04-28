# Node Port - Portainer
export NODE_PORT=$(kubectl get --namespace portainer -o jsonpath="{.spec.ports[1].nodePort}" services portainer)\n  export NODE_IP=$(kubectl get nodes --namespace portainer -o jsonpath="{.items[0].status.addresses[0].address}")\n  echo https://$NODE_IP:$NODE_PORT

# Get current assignments
kubectl get svc --all-namespaces -o wide

# Load Balancer - Portainer
export SERVICE_IP=$(kubectl get svc --namespace portainer portainer --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
  echo https://$SERVICE_IP:9443
kubectl apply -f https://downloads.portainer.io/ce2-19/portainer-agent-k8s-lb.yaml
