#!/bin/bash -e
source install.conf
GAROON_VERSION=$1
PUKIT_BRANCH=$2

PUKIT_MAIN_BRANCH=${GAROON_VERSION}-PUK_GROUP_MAIL #4.10.3-PUK_GROUP_MAIL


echo "-----------------Starting install CloudPartner PUKIT ${PUKIT_BRANCH}"
# download single sp archive
#\\file.dev.cybozu.co.jp\Share\ARCHIVE\RC\pukit\GML\1.5.7\20190507-1443-28
if [ "$PUKIT_BRANCH" == "$PUKIT_MAIN_BRANCH" ]; then
    bash -ex download_archive_pukit.sh "*" ${GML_SINGLE_PARTTERN}
else #dev branch
    bash -ex download_archive_pukit.sh "*-${PUKIT_BRANCH}" ${GML_SINGLE_PARTTERN}
fi


# install new Service Pack
ARCHIVE_NAME=$(find archive -name ${GML_SINGLE_PARTTERN} | sort | tail -n1)
tar xzvf $ARCHIVE_NAME
cd installer_groupmail
sed -i "s/^\[common\]/\[common\]\ngaroon_id=1/" setting.ini
sh install.sh setting.ini

# edit build date
#BUILD_DATE_DEBUG=${TODAY}-${PUKIT_BRANCH}
#sed -i "s/^build_date.*/build_date=${BUILD_DATE_DEBUG}/" /var/www/cgi-bin/cbgrn/garoon.ini

# start Apache
service httpd restart

echo "-----------------End install CloudPartner PUKIT ${PUKIT_BRANCH}"

