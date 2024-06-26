#!/bin/bash -e
source install.conf
SP_VERSION=$1
GAROON_SP_BRANCH=$2
echo "-----------------Starting install Single Service Pack : ${SP_VERSION} - Branch: ${GAROON_SP_BRANCH}"
# download single sp archive
TODAY=$(TZ=":Asia/Bangkok" date +"%Y%m%d")
SP_BRANCH_FOLDER=${TODAY}*
if [ "${GAROON_SP_BRANCH}" != ${SP_VERSION} ]; then
    SP_BRANCH_FOLDER=${GAROON_SP_BRANCH}
fi
bash -ex download_archive.sh ${SP_VERSION}/${SP_BRANCH_FOLDER} ${SP_SINGLE_PARTTERN}

# install new Service Pack
ARCHIVE_NAME=$(find archive -name ${SP_SINGLE_PARTTERN} | sort | tail -n1)
MORE=-9999999 expect - <<EOF
set timeout 100000000

spawn sh ${ARCHIVE_NAME}
expect "yes or no]:"
send "y\n"
expect "id]:"
send "${INSTALLATION_IDENTIFIER}\n"
expect "yes or no]: "
send "y\n"
expect "Installation of Service Pack completed successfully."
exit
EOF


# start Apache
service httpd restart

/etc/init.d/cyss_cbgrn restart

echo "----------------End install Single Service Pack ${SP_VERSION}"

