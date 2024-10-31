#!/bin/sh -x

oc new-project mst-driver

OCP_NODE=$(oc get nodes | grep -v NAME | head -1 | awk '{print $1}')

KVER=$(oc debug node/$OCP_NODE -- uname -r)

OCP_VERSION=$(oc get clusterversion/version -ojsonpath={.status.desired.version})

DRIVER_TOOLKIT_IMAGE=$(oc adm release info $OCP_VERSION --image-for=driver-toolkit)

sed "s#DRIVER_TOOLKIT_IMAGE#${DRIVER_TOOLKIT_IMAGE}#" 0000-buildconfig.yaml.template > 0000-buildconfig.yaml
sed -i "s|DTK_IMAGE|$DRIVER_TOOLKIT_IMAGE|g" 0000-buildconfig.yaml
sed -i "s|KERNEL_VERSION|$KVER|g" 0000-buildconfig.yaml

exit 0

oc create -f 0000-buildconfig.yaml

oc create -f 1000-drivercontainer.yaml


