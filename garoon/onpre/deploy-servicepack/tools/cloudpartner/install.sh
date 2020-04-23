#!/bin/bash -e
echo "-----------------Start install Garoon Cloud Partner ..."
export HOSTNAME=localhost
. initialize.sh

# install service pack
if [ $INSTALL_SERVICE_PACK == true ]; then
    bash -ex cloudpartner/install-cloudpartner.sh $GAROON_VERSION
    bash -ex cloudpartner/install-cloudpartner-sp.sh $GAROON_SP_VERSION $GIT_BRANCH
else # install only Garoon
    bash -ex cloudpartner/install-cloudpartner.sh $GAROON_VERSION $GIT_BRANCH
fi

echo "-----------------End install Garoon Cloud Partner."