#!/bin/bash

ergo ops exec --ip 172.16.74.102 --ip 172.16.74.103  --ip 172.16.74.104 --ip 172.16.74.105  --pk .ssh/id_rsa "apt-get install open-iscsi -y"
ergo ops exec --ip 172.16.74.102 --ip 172.16.74.103  --ip 172.16.74.104 --ip 172.16.74.105  --pk .ssh/id_rsa "systemctl enable --now iscsid"

kubectl create ns longhorn-system

helm upgrade -i longhorn -n longhorn-system longhorn/longhorn \
    --set ingress.enabled=true \
    --set ingress.host=longhorn.local \
    --version=1.1.0
