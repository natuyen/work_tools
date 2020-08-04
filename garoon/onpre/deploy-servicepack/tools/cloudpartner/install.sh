#!/bin/bash -e
echo "-----------------Start install Garoon Cloud Partner ..."
export HOSTNAME=localhost
. initialize.sh

# install service pack
if [ $INSTALL_SERVICE_PACK == true ]; then
    bash -ex cloudpartner/install-cloudpartner.sh $GAROON_VERSION $GAROON_VERSION
    bash -ex cloudpartner/install-cloudpartner-sp.sh $GAROON_SP_VERSION $GIT_BRANCH
else # install only Garoon
    bash -ex cloudpartner/install-cloudpartner.sh $GAROON_VERSION $GIT_BRANCH
fi

# edit build date
TODAY=$(TZ=":Asia/Bangkok" date +"%Y%m%d")
BUILD_DATE_DEBUG=${TODAY}-${GIT_BRANCH}
sed -i "s/^build_date.*/build_date=${BUILD_DATE_DEBUG}/" /var/www/cgi-bin/cbgrn/garoon.ini

echo "-----------------End install Garoon Cloud Partner."