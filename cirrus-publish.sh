#!/bin/env bash

# script to publish/upload images

if [ $CIRRUS_BRANCH == 'master' ]; then
  echo "master -" $CIRRUS_BRANCH
  bash scripts/push.sh
else
  echo "not master -" $CIRRUS_BRANCH
fi
