#!/bin/bash

helm upgrade -i phpmyadmin -n gaea-system bitnami/phpmyadmin \
    --set global.imageRegistry=registry.cn-beijing.aliyuncs.com \
    --set global.storageClass=longhorn \
    --set image.repository=k7scn/phpmyadmin \
    --set ingress.enabled=true \
    --version 8.2.1