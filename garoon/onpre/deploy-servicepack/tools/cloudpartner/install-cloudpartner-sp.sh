#!/bin/bash -e
source install.conf
SP_VERSION=$1
echo "------Starting install Cloud Partner Service Pack : ${SP_VERSION}"
# download sp archive
SP_CLOUDPARTNER_PARTTERN=grn-cloud-${SP_VERSION}.tar.gz
bash -ex download_archive.sh ${SP_VERSION} ${SP_CLOUDPARTNER_PARTTERN}

# install new Service Pack
cd archive
ARCHIVE_NAME=$(find . -name ${SP_CLOUDPARTNER_PARTTERN} | sort | tail -n1)
tar xzvf ${ARCHIVE_NAME}
#cp -rf ../cloudpartner/config grn-cloud-${SP_VERSION}
cd grn-cloud-${SP_VERSION}
sh install.sh config

# edit build date
BUILD_DATE_DEBUG=${TODAY}-${SP_BRANCH}
sed -i "s/^build_date.*/build_date=${BUILD_DATE_DEBUG}/" /var/www/cgi-bin/cbgrn/garoon.ini

# start Apache
service httpd restart
cd /var/www/cgi-bin/cbgrn
ls -l

echo "------End install Cloud Partner Service Pack ${SP_VERSION}"

