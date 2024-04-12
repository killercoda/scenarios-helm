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

kubectl create ns dev-ns
helm -n dev-ns upgrade --install mock-app oci://docker.io/benmalekarim/mock-app

# mark init finished
touch /ks/.initfinished

