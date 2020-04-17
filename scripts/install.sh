#!/usr/bin/env bash

if [[ $BUILD_TYPE == "container" ]]; then

    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt-get install -y docker-ce
    echo '{ "experimental": true }' | sudo tee /etc/docker/daemon.json
    sudo service docker restart

    if [[ "$TRAVIS_PULL_REQUEST" == "false" && ( "$TRAVIS_BRANCH" == "master" || -n "$TRAVIS_TAG" ) ]]; then
        echo $TRAVIS_DOCKER_PASSWORD | docker login $TRAVIS_DOCKER_REGISTRY --username="$TRAVIS_DOCKER_USERNAME" --password-stdin
    fi
else
    sudo apt-get update
fi

sudo apt-get install -y lftp kpartx qemu-utils git debootstrap
