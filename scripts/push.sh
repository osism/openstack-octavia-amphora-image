#!/usr/bin/env bash

# Available environment variables
#
# FTP_HOSTNAME
# FTP_PASSWORD
# FTP_USERNAME
# VERSION

# Set default values

VERSION=${VERSION:-master}

if [[ $VERSION == "master" ]]; then
    TAG=latest
else
    TAG=$VERSION
fi

lftp -u $FTP_USERNAME,$FTP_PASSWORD -e "set sftp:auto-confirm yes; put octavia/diskimage-create/octavia-amphora-haproxy-$VERSION.qcow2; exit;" sftp://$FTP_HOSTNAME
lftp -u $FTP_USERNAME,$FTP_PASSWORD -e "set sftp:auto-confirm yes; put octavia/diskimage-create/octavia-amphora-haproxy-$VERSION.qcow2 -o octavia-amphora-haproxy-$VERSION-$(date +%Y-%m).qcow2; exit;" sftp://$FTP_HOSTNAME
