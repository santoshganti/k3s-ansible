# Congratulations! You have just installed Kubernetes Dashboard in your cluster.

# To access Dashboard run:
#   kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443

# NOTE: In case port-forward command does not work, make sure that kong service name is correct.
#       Check the services in Kubernetes Dashboard namespace using:
#         kubectl -n kubernetes-dashboard get svc

# Dashboard will be available at:
#   https://localhost:8443
