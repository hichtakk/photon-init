#!/bin/sh

set -e

# variables
KIND=${KIND_VERSION:-v0.11.1}
KUBECTL=${KUBECTL_VERSION:-v1.21.0}

# install kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/${KIND}/kind-linux-amd64
install --preserve-timestamps --verbose ./kind /usr/local/bin/

# install kubectl
curl -LO https://dl.k8s.io/release/${KUBECTL}/bin/linux/amd64/kubectl
install --preserve-timestamps --verbose ./kubectl /usr/local/bin/