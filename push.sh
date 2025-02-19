#!/bin/bash

if [ $# != 1 ]; then
  echo "\$1 must be the push-to image, like art4003/chrome-headless:latest" && exit 1
fi
pushto=$1

# build and push both arm64 and amd64 architectures
docker buildx build --push --platform=linux/arm64,linux/amd64 -t ${pushto} .