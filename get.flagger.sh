#!/bin/bash

helm repo update 

helm pull flagger/flagger --untar

kubectl create ns nginx-ingress

helm upgrade -i flagger -f flagger/values.yaml flagger/flagger -n nginx-ingress --version 1.5.0
