#!/bin/sh

set -e

# variables
LINUX_STANDARD_BASE=${LINUX_STANDARD_BASE:-/etc/lsb-release}
DEFAULT_USER=${DEFAULT_USER:-admin}

# execution user validation
if [ "$(whoami)" != "root" ]; then
    echo "executed by non-root user"
    exit 1
fi

# release validation
if [ -e $LINUX_STANDARD_BASE ]; then
    source $LINUX_STANDARD_BASE
else
    echo "lsb file not found"
    exit 1
fi
if [ "${DISTRIB_ID}" != "VMware Photon OS" ]; then
    echo "this is not Photon OS"
    exit 1
fi
if [ "${DISTRIB_RELEASE}" != "4.0" ]; then
    echo "'${DISTRIB_RELEASE}' is not supported Photon OS release version"
    exit 1
fi

# add admin user
useradd -m -G sudo,docker ${DEFAULT_USER}
passwd ${DEFAULT_USER}

# enable docker
systemctl enable docker
mkdir -p /etc/docker                                                                                                   
cat <<EOF > /etc/docker/daemon.json
{
   "exec-opts": ["native.cgroupdriver=cgroupfs"],
   "log-driver": "json-file",
   "log-opts": {"max-size": "1m", "max-file": "3"}
}
EOF
systemctl start docker

# install packages
tdnf install -y sudo git