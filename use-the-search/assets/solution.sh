#!/bin/bash

helm ls -A > /root/releases

helm -n team-yellow uninstall apiserver

helm -n team-yellow install devserver nginx-stable/nginx-ingress
