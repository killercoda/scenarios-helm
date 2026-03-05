#!/bin/bash

cat <<EOT > /root/.vimrc
set expandtab
set tabstop=2
set shiftwidth=2
EOT

# init scenario
rm $0


# scenario specific
mkdir /charts && cd /charts
git clone https://github.com/BENMALEKarim/helm-scenarios-charts.git
sleep 2s
cp helm-scenarios-charts/mock-app-2.0.0.tgz .
rm -rf helm-scenarios-charts
tar -xzvf mock-app-2.0.0.tgz
rm -rf mock-app-2.0.0.tgz

kubectl create ns dev-ns
kubectl create ns prod-ns
# mark init finished
touch /ks/.initfinished

