#!/bin/zsh
echo "Start Garoon"
source build/build.conf && export DEV_VERSION
docker-compose up -d