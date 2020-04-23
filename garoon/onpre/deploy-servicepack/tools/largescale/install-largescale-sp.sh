#!/bin/bash -e
source install.conf
SP_VERSION=$1
GAROON_SP_BRANCH=$2
echo "------Starting install LargeScale Service Pack : ${SP_VERSION} - Branch: ${GAROON_SP_BRANCH}"
# download single sp archive
TODAY=$(TZ=":Asia/Bangkok" date +"%Y%m%d")
SP_BRANCH_FOLDER=${TODAY}*
if [ "${GAROON_SP_BRANCH}" != ${SP_VERSION} ]; then
    SP_BRANCH_FOLDER=${GAROON_SP_BRANCH}
fi
bash -ex download_archive.sh ${SP_VERSION}/${SP_BRANCH_FOLDER} ${SP_LARGESCALE_PARTTERN}

# install new Service Pack
ARCHIVE_NAME=$(find archive -name ${SP_LARGESCALE_PARTTERN} | sort | tail -n1)
cd archive
tar xzvf $(basename ${ARCHIVE_NAME})
cp -rf ../largescale/setting.ini installer_sp
cd installer_sp
sh install.sh setting.ini

# edit build date
BUILD_DATE_DEBUG=${TODAY}-${GAROON_SP_BRANCH}
sed -i "s/^build_date.*/build_date=${BUILD_DATE_DEBUG}/" /usr/local/cybozu/cbgrn/garoon.ini

# start Apache
service httpd restart

/etc/init.d/cyss_cbgrn restart

echo "------End install LargeScale Service Pack ${SP_VERSION}"

