#!/bin/bash -e
echo "-----------------Start read config"

GAROON_VERSION=""
FOREST_VERSION=""
GAROON_SP_VERSION=""
if [ -f "build.conf" ]; then
    source build.conf
    GAROON_VERSION=$PRODUCT_VERSION
    FOREST_VERSION=F$FOREST_VERSION
fi

GAROON_SP_VERSION=$GAROON_VERSION
GAROON_SP_BRANCH=""
if [ -f "build_sp.conf" ]; then
    source build_sp.conf
    GAROON_SP_VERSION=$VERSION
    GAROON_SP_BRANCH=$SP_BRANCH
fi

# assign environment
export GAROON_VERSION=$GAROON_VERSION
export FOREST_VERSION=$FOREST_VERSION
export GAROON_SP_VERSION=$GAROON_SP_VERSION
export GAROON_SP_BRANCH=$GAROON_SP_BRANCH

# get version
echo "GAROON_VERSION=$GAROON_VERSION"
echo "GAROON_SP_VERSION=$GAROON_SP_VERSION"
echo "GAROON_SP_BRANCH=$GAROON_SP_BRANCH"
echo "INSTALL_SERVICE_PACK=$INSTALL_SERVICE_PACK"

echo "-----------------End read config."