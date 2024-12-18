FROM registry.access.redhat.com/ubi9/ubi-init:latest

COPY mft-4.29.0-131-x86_64-rpm.tgz /root/mft-4.29.0-131-x86_64-rpm.tgz
COPY build-mft.sh /bin/build-mft.sh
COPY mft-build.service /etc/systemd/system/mft-build.service

RUN dnf -y install pciutils gcc make rpm-build \
      kernel-devel-$(uname -r)

USER root


