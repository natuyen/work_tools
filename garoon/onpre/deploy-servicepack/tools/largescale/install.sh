#!/bin/bash -e

echo "-----------------Start install Garoon Largescale ..."
export HOSTNAME=localhost
. initialize.sh

# install Garoon
#if [ ${UNINSTALL_OLD_GAROON} == true ]; then
    bash -ex largescale/install-largescale.sh $GAROON_VERSION
#fi

# install sp
if [ $INSTALL_SERVICE_PACK == true -a "$GAROON_SP_VERSION" != "" ]; then
    bash -ex largescale/install-largescale-sp.sh $GAROON_SP_VERSION
fi

echo "-----------------End install Garoon Largescale."

