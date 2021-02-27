#!/bin/bash

kubectl create ns ops

helm upgrade -i mariadb -n ops \
    --set global.imageRegistry=registry.cn-beijing.aliyuncs.com
    --set global.storageClass=openebs-hostpath
    bitnami/mariadb --version 9.3.4