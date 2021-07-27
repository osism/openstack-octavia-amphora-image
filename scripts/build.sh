#!/usr/bin/env bash

# Available environment variables
#
# DISTRIBUTION
# DISTRIBUTION_RELEASE
# VERSION

# Set default values

VERSION=${VERSION:-master}
DISTRIBUTION=${DISTRIBUTION:-ubuntu-minimal}
DISTRIBUTION_RELEASE=${DISTRIBUTION_RELEASE:-focal}

export CLOUD_INIT_DATASOURCES="ConfigDrive, OpenStack"
export DIB_CLOUD_INIT_DATASOURCES="ConfigDrive, OpenStack"

BRANCH="stable/$VERSION"

if [[ ! -e octavia ]]; then
    git clone https://github.com/openstack/octavia
fi

cd octavia/diskimage-create

bash diskimage-create.sh \
    -a amd64 \
    -b haproxy \
    -d $DISTRIBUTION_RELEASE \
    -g $BRANCH \
    -i $DISTRIBUTION \
    -o octavia-amphora-haproxy-$VERSION.qcow2 \
    -s 2 \
    -t qcow2
