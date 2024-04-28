# NAME: sealed-secrets
# LAST DEPLOYED: Wed Apr 17 01:45:23 2024
# NAMESPACE: kube-system
# STATUS: deployed
# REVISION: 1
# TEST SUITE: None
# NOTES:
# ** Please be patient while the chart is being deployed **

# You should now be able to create sealed secrets.

# 1. Install the client-side tool (kubeseal) as explained in the docs below:

    # https://github.com/bitnami-labs/sealed-secrets#installation-from-source

# 2. Create a sealed secret file running the command below:

    kubectl create secret generic secret-name --dry-run=client --from-literal=foo=bar -o [json|yaml] | \
    kubeseal \
      --controller-name=sealed-secrets-controller \
      --controller-namespace=kube-system \
      --format yaml > mysealedsecret.[json|yaml]

# The file mysealedsecret.[json|yaml] is a commitable file.

# If you would rather not need access to the cluster to generate the sealed secret you can run:

    kubeseal \
      --controller-name=sealed-secrets-controller \
      --controller-namespace=kube-system \
      --fetch-cert > mycert.pem

# to retrieve the public cert used for encryption and store it locally. You can then run 'kubeseal --cert mycert.pem' instead to use the local cert e.g.

    kubectl create secret generic secret-name --dry-run=client --from-literal=foo=bar -o [json|yaml] | \
    kubeseal \
      --controller-name=sealed-secrets-controller \
      --controller-namespace=kube-system \
      --format [json|yaml] --cert mycert.pem > mysealedsecret.[json|yaml]

# 3. Apply the sealed secret

    kubectl create -f mysealedsecret.[json|yaml]

# Running 'kubectl get secret secret-name -o [json|yaml]' will show the decrypted secret that was generated from the sealed secret.

# Both the SealedSecret and generated Secret must have the same name and namespace.

####################### RCLONE #######################

echo -n bar | kubectl create secret generic plexrclone --dry-run=client --from-file=foo=/Users/santoshganti/ode/rclone.conf -o json > secretplexrclone.json
kubeseal -f secretplexrclone.json -w sealedsecretplexrclone.json
kubectl create -f sealedsecretplexrclone.json
kubectl get secret plexrclone
