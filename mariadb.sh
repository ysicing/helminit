#!/bin/bash

kubectl create ns gaea-system

helm upgrade -i mariadb -n gaea-system \
    --set global.imageRegistry=registry.cn-beijing.aliyuncs.com \
    --set global.storageClass=longhorn \
    --set image.repository=k7scn/mariadb \
    --set auth.rootPassword=rootPassword \
    --set auth.database=zeus \
    --set auth.username=zeus \
    --set auth.password=zeusPassword \
    --set primary.service.type=NodePort \
    --set secondary.replicaCount=0 \
    --set metrics.enabled=true \
    --set metrics.image.repository=k7scn/mysqld-exporter \
    --set metrics.serviceMonitor.enabled=true \
    bitnami/mariadb --version 9.3.4