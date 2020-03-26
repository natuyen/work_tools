#!/bin/bash -e
echo "-----------------Start install Garoon Single ..."
bash initialize.sh

# GAROON_VERSION=""
# GAROON_SP_VERSION=""
# if [ -f "build.conf" ]; then
#     source build.conf
#     GAROON_VERSION=$PRODUCT_VERSION
# fi

# GAROON_SP_VERSION=$GAROON_VERSION
# if [ -f "build_sp.conf" ]; then
#     source build_sp.conf
#     GAROON_SP_VERSION=$VERSION
# fi

# get version
echo "GAROON_VERSION=$GAROON_VERSION"
echo "GAROON_SP_VERSION=$GAROON_SP_VERSION"


# install Garoon
#if [ ${UNINSTALL_OLD_GAROON} == true ]; then
    bash -ex single/install-single.sh $GAROON_VERSION
#fi

# install sp
if [ "$GAROON_SP_VERSION" != "" ]; then
    bash -ex single/install-single-sp.sh $GAROON_SP_VERSION
fi


echo "-----------------End install Garoon Single."



