#!/bin/bash

cat <<EOT > /root/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2
EOT

# init scenario
rm $0
bash /ks/k8s.sh


# scenario specific
wget https://get.helm.sh/helm-v3.8.2-linux-amd64.tar.gz
tar xzf helm-v3.8.2-linux-amd64.tar.gz
mv linux-amd64/helm /usr/bin/
chmod a+x /usr/bin/helm
rm -rf linux-amd64 helm-v3.8.2-linux-amd64.tar.gz


helm repo add nginx-stable https://helm.nginx.com/stable
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

helm install webserver bitnami/apache  --set service.type=ClusterIP --wait
helm upgrade webserver bitnami/apache  --set service.type=ClusterIP \
  --set commonAnnotations.Hello=World!
helm upgrade webserver bitnami/apache  --set service.type=ClusterIP \
  --set global.imageRegistry=jpowfek

# mark init finished
touch /ks/.initfinished

