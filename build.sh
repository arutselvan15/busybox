#!/bin/bash
set -e

echo "Docker build ..."

docker build -t bb-curl .

echo "Docker push ..."
docker tag bb-curl arutselvan15/busybox:latest
docker push arutselvan15/busybox:latest

echo "Build completed"