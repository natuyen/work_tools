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

# edit build date
TODAY=$(TZ=":Asia/Bangkok" date +"%Y%m%d")
BUILD_DATE_DEBUG=${TODAY}-${GIT_BRANCH}
sed -i "s/^build_date.*/build_date=${BUILD_DATE_DEBUG}/" /usr/local/cybozu/cbgrn/garoon.ini

echo "-----------------End install Garoon Largescale."

