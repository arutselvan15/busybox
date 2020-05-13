#!/bin/bash
set -e

echo "Docker build ..."

docker build -t bb-curl .

echo "Docker push ..."
docker tag bb-curl containers.cisco.com/arselvan/busybox:latest
docker push containers.cisco.com/arselvan/busybox:latest

echo "Build completed"