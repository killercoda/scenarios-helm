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
mkdir /charts && cd /charts
helm pull oci://docker.io/benmalekarim/mock-app

kubectl create ns dev-ns
helm -n dev-ns install --wait mock-app oci://docker.io/benmalekarim/mock-app

# mark init finished
touch /ks/.initfinished

