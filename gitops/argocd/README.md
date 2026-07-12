# first install
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd -n argocd
helm install argocd argo/argo-cd -n argocd -f values.yaml

kubectl apply -f httproute.yaml