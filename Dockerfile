FROM registry.access.redhat.com/ubi8/ubi-init:latest

COPY mft-4.29.0-131-x86_64-rpm.tgz /root/mft-4.29.0-131-x86_64-rpm.tgz
COPY build-mft.sh /bin/build-mft.sh
COPY mft-build.service /etc/systemd/system/mft-build.service

RUN dnf -y update && \
    dnf -y install openssl-libs \
      groff-base \
      libibverbs \
      libpcap \
      libpcap-devel \
      libpkgconf \
      ncurses \
      openssl \
      perl-Carp \
      perl-Data-Dumper \
      perl-Digest \
      perl-Digest-MD5 \
      perl-Encode \
      perl-Errno \
      perl-Exporter \
      perl-File-Path \
      perl-File-Temp \
      perl-Getopt-Long \
      perl-HTTP-Tiny \
      perl-IO \
      perl-IO-Socket-IP \
      perl-IO-Socket-SSL \
      perl-MIME-Base64 \
      perl-Mozilla-CA \
      perl-Net-SSLeay \
      perl-PathTools \
      perl-Pod-Escapes \
      perl-Pod-Perldoc \
      perl-Pod-Simple \
      perl-Pod-Usage \
      perl-Scalar-List-Utils \
      perl-Socket \
      perl-Storable \
      perl-Term-ANSIColor \
      perl-Term-Cap \
      perl-Text-ParseWords \
      perl-Text-Tabs+Wrap \
      perl-Time-Local \
      perl-URI \
      perl-Unicode-Normalize \
      perl-constant \
      perl-interpreter \
      perl-libnet \
      perl-libs \
      perl-macros \
      perl-parent \
      perl-podlators \
      perl-threads \
      perl-threads-shared \
      pkgconf \
      pkgconf-m4 \
      pkgconf-pkg-config \
      openssl-pkcs11 \
      gcc \
      make \
      rpm-build \
      pciutils \
      zlib \
      zlib-devel && \
    dnf clean all && \
    rm -rf /var/cache/yum /var/cache/dnf && \
    systemctl enable mft-build.service

USER root


