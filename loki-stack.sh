#!/bin/bash

kubectl create ns loki

helm upgrade -i loki -n loki grafana/loki-stack --set fluent-bit.enabled=true

