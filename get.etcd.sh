#!/bin/bash

helm repo update

helm pull bitnami/etcd --untar 

kubectl create ns ops

helm upgrade -i etcd -f etcd/values.yaml -n ops bitnami/etcd --version 5.3.0
