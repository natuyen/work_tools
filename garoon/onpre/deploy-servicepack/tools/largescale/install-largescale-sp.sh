#!/bin/bash -e
source install.conf
SP_VERSION=$1
echo "------Starting install LargeScale Service Pack : ${SP_VERSION}"
# download sp archive
bash -ex download_archive.sh ${SP_VERSION} ${SP_LARGESCALE_PARTTERN}
# install new Service Pack
ARCHIVE_NAME=$(find archive -name ${SP_LARGESCALE_PARTTERN} | sort | tail -n1)
cd archive
tar xzvf $(basename ${ARCHIVE_NAME})
cp -rf ../largescale/setting.ini installer_sp
cd installer_sp
sh install.sh setting.ini

# edit build date
BUILD_DATE_DEBUG=${TODAY}-${SP_BRANCH}
sed -i "s/^build_date.*/build_date=${BUILD_DATE_DEBUG}/" /usr/local/cybozu/cbgrn/garoon.ini

# start Apache
service httpd restart
cd /usr/local/cybozu/cbgrn
ls -l

/etc/init.d/cyde_5_0 restart
/etc/init.d/cyde_5_0 status
/etc/init.d/cyss_cbgrn restart

echo "------End install LargeScale Service Pack ${SP_VERSION}"

