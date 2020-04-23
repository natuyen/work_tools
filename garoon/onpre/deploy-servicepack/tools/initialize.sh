#!/bin/bash -e
echo "-----------------Start read config"
source install.conf
GAROON_VERSION=""
FOREST_VERSION=""
GAROON_SP_VERSION=""
if [ -f "build.conf" ]; then
    source build.conf
    GAROON_VERSION=$PRODUCT_VERSION
    FOREST_VERSION=F$DEV_VERSION
fi

GAROON_SP_VERSION=$GAROON_VERSION
if [ -f "build_sp.conf" ]; then
    source build_sp.conf
    GAROON_SP_VERSION=$VERSION
fi

# assign environment
export GAROON_VERSION=$GAROON_VERSION
export FOREST_VERSION=$FOREST_VERSION
export GAROON_SP_VERSION=$GAROON_SP_VERSION

# get version
echo "GIT_BRANCH=$GIT_BRANCH"
echo "GAROON_VERSION=$GAROON_VERSION"
echo "GAROON_SP_VERSION=$GAROON_SP_VERSION"
echo "INSTALL_SERVICE_PACK=$INSTALL_SERVICE_PACK"

echo "-----------------End read config."