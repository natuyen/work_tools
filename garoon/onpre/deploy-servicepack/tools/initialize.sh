#!/bin/bash -e
echo "-----------------Read config"

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

# get version
echo "GAROON_VERSION=$GAROON_VERSION"
echo "GAROON_SP_VERSION=$GAROON_SP_VERSION"
