#!/bin/sh

OCP_VERSION=$(oc get clusterversion/version -ojsonpath={.status.desired.version})

DRIVER_TOOLKIT_IMAGE=$(oc adm release info $OCP_VERSION --image-for=driver-toolkit)

sed "s#DRIVER_TOOLKIT_IMAGE#${DRIVER_TOOLKIT_IMAGE}#" 0000-buildconfig.yaml.template > 0000-buildconfig.yaml

oc create -f 0000-buildconfig.yaml

$ oc create -f 1000-drivercontainer.yaml


