#!/bin/bash -e

echo "-----------------Start install Garoon Largescale ..."
export HOSTNAME=localhost
. initialize.sh

# install service pack
if [ $INSTALL_SERVICE_PACK == true ]; then
    bash -ex largescale/install-largescale.sh $GAROON_VERSION
    bash -ex largescale/install-largescale-sp.sh $GAROON_SP_VERSION $GIT_BRANCH
else # install only Garoon
    bash -ex largescale/install-largescale.sh $GIT_BRANCH
fi


echo "-----------------End install Garoon Largescale."

