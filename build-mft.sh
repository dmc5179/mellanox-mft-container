#!/bin/bash

{
pushd /root

# kernel-devel-matched will install the kernel-devel packages that match the running kernel
dnf -y install kernel-devel-matched gcc make rpm-build pciutils usbutils

tar --no-same-owner -xzf /root/mft-4.29.0-131-x86_64-rpm.tgz

pushd mft-4.29.0-131-x86_64-rpm


} > /var/log/mft-build.log
