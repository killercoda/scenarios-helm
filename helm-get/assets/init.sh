#!/bin/bash

cat <<EOT > /root/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2
EOT

# init scenario
rm $0


# scenario specific
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

helm install webserver bitnami/apache --set service.type=ClusterIP \
  --set commonAnnotations.Hello=World!


# mark init finished
touch /ks/.initfinished

