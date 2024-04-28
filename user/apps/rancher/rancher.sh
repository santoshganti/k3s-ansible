helm install rancher rancher-alpha/rancher \
  --namespace cattle-system \
  --set hostname=rancher.homelab.santoshganti.net \
  --set bootstrapPassword=admin


helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=rancher.example.com

helm install rancher rancher-latest/rancher \
  --namespace cattle-system \
  --set hostname=rancher.homelab.santoshganti.net \
  --set bootstrapPassword=admin

# installation
helm install cert-manager jetstack/cert-manager   --namespace cert-manager   --create-namespace   --set installCRDs=true
helm install rancher rancher-latest/rancher   --namespace cattle-system   --set hostname=rancher.homelab.santoshganti.net   --set bootstrapPassword=admin

# NAME: rancher
# LAST DEPLOYED: Fri Apr 12 07:46:37 2024
# NAMESPACE: cattle-system
# STATUS: deployed
# REVISION: 1
# TEST SUITE: None
# NOTES:
# Rancher Server has been installed.

# NOTE: Rancher may take several minutes to fully initialize. Please standby while Certificates are being issued, Containers are started and the Ingress rule comes up.

# Check out our docs at https://rancher.com/docs/

# If you provided your own bootstrap password during installation, browse to https://rancher.darkcatalist.com to get started.

# If this is the first time you installed Rancher, get started by running this command and clicking the URL it generates:

echo https://rancher.homelab.santoshganti.net/dashboard/?setup=$(kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}')

# https://rancher.darkcatalist.com/dashboard/?setup=admin

# To get just the bootstrap password on its own, run:

kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword|base64decode}}{{ "\n" }}'

# admin
