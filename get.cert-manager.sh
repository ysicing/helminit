#!/bin/bash

helm repo update

helm pull jetstack/cert-manager --untar

kubectl create ns ops

helm upgrade -i cert-manager -f cert-manager/values.yaml -n ops  jetstack/cert-manager --version v1.1.0
