#!/bin/bash -e
echo "-----------------Start install Garoon Single ..."
. initialize.sh

# install Garoon
#if [ ${UNINSTALL_OLD_GAROON} == true ]; then
    bash -ex single/install-single.sh $GAROON_VERSION
#fi

# install sp
if [ $INSTALL_SERVICE_PACK == true -a "$GAROON_SP_VERSION" != "" ]; then
    bash -ex single/install-single-sp.sh $GAROON_SP_VERSION
fi


echo "-----------------End install Garoon Single."



