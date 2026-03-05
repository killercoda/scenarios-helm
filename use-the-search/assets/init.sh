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
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update


# mark init finished
touch /ks/.initfinished

