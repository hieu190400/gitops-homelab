# GitOps Homelab

## Goal

- Learn Kubernetes
- Learn Helm
- Learn ArgoCD
- Learn GitOps
- Build production-like homelab

## Current Architecture

Proxmox
    ↓
k3s (3 nodes)



## install guide.

0. Prerequisites

```
sudo curl -Lo /usr/local/bin/k3s https://github.com/k3s-io/k3s/releases/download/v1.33.3%2Bk3s1/k3s
sudo chmod +x /usr/local/bin/k3s
curl -Lo install.sh https://get.k3s.io
chmod +x install.sh
```

1. Control panel node:

    ```
    INSTALL_K3S_SKIP_DOWNLOAD=true ./install.sh
    sudo cat /var/lib/rancher/k3s/server/node-token
    ```


2. Worker node:

    ```
    INSTALL_K3S_SKIP_DOWNLOAD=true K3S_URL=https://<Control_Panel_IP>:6443 K3S_TOKEN=<node-token> ./install.sh
    ```

3. Create config Laptop/ other PC.
 
    In control panel node

    ```
    sudo cat /etc/rancher/k3s/k3s.yaml
    ```

    In PC run kubectl cli
    - Copy to <home-folder>/.kube/config
    - change `server: https://127.0.0.1:6443` -> Control panel node IP

## bootstrap argocd

```
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd -n argocd --create-namespace -f gitops/argocd/values.yaml
```

kubectl apply -f bootstrap\root-app.yaml

