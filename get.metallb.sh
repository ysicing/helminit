#!/bin/bash

helm repo update

helm pull  bitnami/metallb --untar

kubectl create ns metallb-system

helm upgrade -i metallb -f metallb/values.yaml -n metallb-system bitnami/metallb --version 2.0.2
