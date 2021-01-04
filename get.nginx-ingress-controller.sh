#!/bin/bash

helm repo update 

helm pull bitnami/nginx-ingress-controller --untar 

kubectl create ns nginx-ingress

helm upgrade -i nginx-ingress-controller -f nginx-ingress-controller/values.yaml -n nginx-ingress bitnami/nginx-ingress-controller --version 7.0.9
