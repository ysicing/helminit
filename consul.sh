#!/bin/bash

helm upgrade -i consul -n gaea-system \
    --set global.imageRegistry=registry.cn-beijing.aliyuncs.com \
    --set global.storageClass=longhorn \
    --set image.repository=k7scn/consul \
    --set replicaCount=1 \
    --set service.type=NodePort \
    --set ingress.enabled=true \
    --set metrics.enabled=true \
    --set metrics.image.repository=k7scn/consul-exporter \
    --set metrics.serviceMonitor.enabled=true \
    bitnami/consul --version 9.2.4