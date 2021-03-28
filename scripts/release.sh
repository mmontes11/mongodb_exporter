#!/usr/bin/env bash

set -e
#!/bin/bash

set -e

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

name="mongodb-prometheus-exporter"
tag=$(git describe --abbrev=0 --tags)
image="$DOCKER_USERNAME/$name"
platform="linux/amd64,linux/arm64,linux/arm"

echo "🏗    Building '$image'"
docker buildx create --name "$name" --use --append
docker buildx build --platform "$platform" -t "$image:$tag" -t "$image:latest" --push .
docker buildx imagetools inspect "$image:latest"
