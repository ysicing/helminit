#!/bin/bash

kubectl create ns metallb-system

helm upgrade -i metallb -n metallb-system bitnami/metallb \
    --set global.imageRegistry=registry.cn-beijing.aliyuncs.com \
    --set controller.image.repository=k7scn/metallb-controller \
    --set speaker.image.repository=k7scn/metallb-speaker \
    --version=2.3.2

cat > metallb.cm.yaml <<EOF
apiVersion: v1
kind: ConfigMap
metadata:
  namespace: metallb-system
  name: metallb-config
  annotations:
    meta.helm.sh/release-name: metallb
    meta.helm.sh/release-namespace: metallb-system
  labels:
    app.kubernetes.io/instance: metallb
    app.kubernetes.io/managed-by: Helm
    app.kubernetes.io/name: metallb
    helm.sh/chart: metallb-2.3.2  
data:
  config: |
    address-pools:
    - name: default
      protocol: layer2
      addresses:
      - 172.16.74.130-172.16.74.150
EOF

kubectl apply -f metallb.cm.yaml -n metallb-system