#!/bin/bash -e
source install.conf
GAROON_VERSION=$1
echo "-----------------Starting install Garoon Single ${GAROON_VERSION}..."
# download single archive
bash -ex download_archive.sh ${GAROON_VERSION} ${GAROON_SINGLE_PARTTERN}

# uninstall old Garoon
echo "--Start Uninstall old Garoon ..."
if [ -e /var/www/cgi-bin/cbgrn/uninstall_cbgrn ]; then
  sh /var/www/cgi-bin/cbgrn/uninstall_cbgrn complete
fi
if [ -e /usr/local/cybozu/mysql-5.0/uninstall_cyde_5_0 ]; then
  sh /usr/local/cybozu/mysql-5.0/uninstall_cyde_5_0 complete
fi
rm -rf /var/www/cgi-bin/cbgrn
rm -rf /var/www/html/cbgrn
rm -rf /usr/local/cybozu
rm -f /etc/init.d/cyde_5_0
rm -f /etc/init.d/cyss_cbgrn
echo "--End Uninstall old Garoon."

# install new Garoon
service httpd restart
ARCHIVE_NAME=$(find archive -name ${GAROON_SINGLE_PARTTERN} | sort | tail -n1)
MORE=-9999999 expect - <<EOF
set timeout 100000000

spawn sh ${ARCHIVE_NAME}
expect "yes or no]:"
send "y\n"
expect "cbgrn]:"
send "${INSTALLATION_IDENTIFIER}\n"
expect "1|2]:"
send "1\n"
expect "usr/local/cybozu]: "
send "\n"
expect "Enter Password: "
send "cybozu\n"
expect "Enter Password: "
send "cybozu\n"
expect "Enter Password: "
send "cybozu\n"
expect "/var/www/cgi-bin]: "
send "\n"
expect "var/www/html]: "
send "\n"
expect "apache]: "
send "\n"
expect "yes or no]:"
send "y\n"
expect "10.10.203.55/cgi-bin/${INSTALLATION_IDENTIFIER}/grn.cgi"
send "\n"
exit
EOF

# start Apache
service httpd restart
cd /var/www/cgi-bin/cbgrn
ls -l

/etc/init.d/cyde_5_0 restart

echo "-----------------End install Garoon Single ${GAROON_VERSION}..."
