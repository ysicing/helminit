#!/bin/bash

helm upgrade -i nginx-ingress-controller -n kube-system  bitnami/nginx-ingress-controller \
    --set global.imageRegistry=registry.cn-beijing.aliyuncs.com \
    --set image.repository=k7scn/nginx-ingress-controller \
    --set defaultBackend.image.repository=k7scn/nginx \
    --set metrics.enabled=false \
    --version=7.4.6
