#!/bin/bash

if [ $# != 1 ]; then
  echo "\$1 must be the tag, like art4003/chrome-headless:latest" && exit 1
fi
tag=$1

# Build only the current architecture
docker buildx build -o type=docker -t ${tag} .