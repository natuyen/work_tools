#!/bin/bash -e
echo "-----------------Start read config"

GAROON_VERSION=""
GAROON_SP_VERSION=""
if [ -f "build.conf" ]; then
    source build.conf
    GAROON_VERSION=$PRODUCT_VERSION
fi

GAROON_SP_VERSION=$GAROON_VERSION
if [ -f "build_sp.conf" ]; then
    source build_sp.conf
    GAROON_SP_VERSION=$VERSION
fi

# assign environment
export GAROON_VERSION=$GAROON_VERSION 
export GAROON_SP_VERSION=$GAROON_SP_VERSION 

# get version
echo "1GAROON_VERSION=$GAROON_VERSION"
echo "1GAROON_SP_VERSION=$GAROON_SP_VERSION"
echo "1INSTALL_SERVICE_PACK=$INSTALL_SERVICE_PACK"

echo "-----------------End read config."