#!/usr/bin/env bash

# Available environment variables
#
# BUILD_TYPE
# DISTRIBUTION
# DISTRIBUTION_RELEASE
# VERSION

# Set default values

VERSION=${VERSION:-master}
DISTRIBUTION=${DISTRIBUTION:-ubuntu-minimal}
DISTRIBUTION_RELEASE=${DISTRIBUTION_RELEASE:-bionic}

export CLOUD_INIT_DATASOURCES="ConfigDrive, OpenStack"
export DIB_CLOUD_INIT_DATASOURCES="ConfigDrive, OpenStack"

if [[ $VERSION != "master" ]]; then
    TAG=$VERSION
    VERSION="stable/$VERSION"
else
    TAG=latest
fi

if [[ ! -e octavia ]]; then
    git clone https://github.com/openstack/octavia
fi

cd octavia/diskimage-create

bash diskimage-create.sh \
    -a amd64 \
    -b haproxy \
    -d $DISTRIBUTION_RELEASE \
    -g $VERSION \
    -i $DISTRIBUTION \
    -o octavia-amphora-haproxy-$TAG.qcow2 \
    -s 2 \
    -t qcow2
