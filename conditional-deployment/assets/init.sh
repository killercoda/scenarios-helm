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

mkdir /charts && cd /charts
git clone https://github.com/BENMALEKarim/helm-scenarios-charts.git
cp helm-scenarios-charts/mock-app-2.0.0 .
rm -rf helm-scenarios-charts
tar -xzvf mock-app-2.0.0.tgz
rm -rf mock-app-2.0.0.tgz

kubectl create ns dev-ns
kubectl create ns prod-ns
# mark init finished
touch /ks/.initfinished

