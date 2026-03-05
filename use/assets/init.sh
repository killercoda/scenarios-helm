#!/bin/bash

cat <<EOT > /root/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2
EOT

# init scenario
rm $0


# scenario specific
helm repo add podinfo https://stefanprodan.github.io/podinfo
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

kubectl create ns team-blue
kubectl create ns team-yellow
helm -n team-blue install webserver bitnami/apache
helm -n team-yellow install apiserver bitnami/apache


# mark init finished
touch /ks/.initfinished

