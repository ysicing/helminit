#!/bin/bash

helm upgrade -i rook-ceph rook-release/rook-ceph -n rook-ceph \
    --set image.repository=registry.cn-beijing.aliyuncs.com/k7scn/ceph \
    --set hostpathRequiresPrivileged=true \
    --set csi.cephcsi.image=registry.cn-beijing.aliyuncs.com/k7scn/cephcsi:v3.2.0 \
    --set csi.registrar.image=registry.cn-beijing.aliyuncs.com/k7scn/csi-node-driver-registrar:v2.0.1 \
    --set csi.resizer.image=registry.cn-beijing.aliyuncs.com/k7scn/csi-resizer:v1.0.0 \
    --set csi.provisioner.image=registry.cn-beijing.aliyuncs.com/k7scn/csi-provisioner:v2.0.0 \
    --set csi.snapshotter.image=registry.cn-beijing.aliyuncs.com/k7scn/csi-snapshotter:v3.0.0 \
    --set csi.attacher.image=registry.cn-beijing.aliyuncs.com/k7scn/csi-attacher:v3.0.0

