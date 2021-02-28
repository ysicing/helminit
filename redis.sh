#!/bin/bash

helm upgrade -i redis -n gaea-system bitnami/redis \
    --set global.imageRegistry=registry.cn-beijing.aliyuncs.com \
    --set global.storageClass=longhorn \
    --set image.repository=k7scn/redis \
    --set cluster.enabled=false \
    --set password=rootPassword \
    --set service.type=NodePort \
    --set metrics.enabled=true \
    --set metrics.image.repository=k7scn/redis-exporter \
    --set metrics.serviceMonitor.enabled=true \
    --version 12.8.0
