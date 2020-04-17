#!/usr/bin/env bash

# Available environment variables
#
# BUILD_TYPE
# FTP_HOSTNAME
# FTP_PASSWORD
# FTP_USERNAME
# VERSION

# Set default values

BUILD_TYPE=${BUILD_TYPE:-disk}
VERSION=${VERSION:-master}

if [[ $VERSION == "master" ]]; then
    TAG=latest
else
    TAG=$VERSION
fi

if [[ $BUILD_TYPE == "disk" ]]; then
    lftp -u $FTP_USERNAME,$FTP_PASSWORD -e "set sftp:auto-confirm yes; put octavia/diskimage-create/octavia-amphora-haproxy-$VERSION.qcow2; exit;" sftp://$FTP_HOSTNAME
    lftp -u $FTP_USERNAME,$FTP_PASSWORD -e "set sftp:auto-confirm yes; put octavia/diskimage-create/octavia-amphora-haproxy-$VERSION.qcow2 -o octavia-amphora-haproxy-$VERSION-$(date +%Y-%m).qcow2; exit;" sftp://$FTP_HOSTNAME
fi

if [[ $BUILD_TYPE == "container" ]]; then
    docker tag osism/octavia-amphora-haproxy:$TAG $TRAVIS_DOCKER_REGISTRY/osism/octavia-amphora-haproxy:$TAG
    docker push $TRAVIS_DOCKER_REGISTRY/osism/octavia-amphora-haproxy:$TAG
fi
