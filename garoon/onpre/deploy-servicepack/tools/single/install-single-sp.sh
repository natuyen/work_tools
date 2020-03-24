#!/bin/bash -e
source install.conf
SP_VERSION=$1

echo "-----------------Starting install Single Service Pack : ${SP_VERSION}"
# download sp archive
bash -ex download_archive.sh ${SP_VERSION} ${SP_SINGLE_PARTTERN}

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

# edit build date
#BUILD_DATE_DEBUG=${TODAY}-${SP_BRANCH}
#sed -i "s/^build_date.*/build_date=${BUILD_DATE_DEBUG}/" /var/www/cgi-bin/cbgrn/garoon.ini

# start Apache
service httpd restart
cd /var/www/cgi-bin/cbgrn
ls -l

echo "----------------End install Single Service Pack ${SP_VERSION}"

