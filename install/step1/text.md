
Everything can also be found on:
https://helm.sh/docs/intro/quickstart
https://helm.sh/docs/intro/install
https://helm.sh/docs/intro/using_helm

<br>

We're working here with a Ubuntu Linux VM that has never seen anything "Kubernetes" before!

<br>

## Install K3s
Helm needs a running Kubernetes cluster, hence we install K3s:

```plain
curl -sfL https://get.k3s.io | sh -
```{{exec}}

```plain
kubectl get node
```{{exec}}

<br>

## Install Helm
```plain
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
```{{exec}}

```plain
helm -h
```{{exec}}

<br>

## Use Helm
```
helm repo add bitnami https://charts.bitnami.com/bitnami
```{{exec}}

```
helm install happy-panda bitnami/wordpress
```{{exec}}

```
helm ls
```{{exec}}
