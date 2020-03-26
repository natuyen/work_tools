#!/bin/bash -e
source install.conf
GAROON_VERSION=$1
echo "GAROON_VERSION=$GAROON_VERSION"
echo "----------------------------Starting install Garoon Largescale ${GAROON_VERSION}..."
# download single archive
bash -ex download_archive.sh ${GAROON_VERSION} ${GAROON_LARGESCALE_PARTTERN}

# uninstall old Garoon
echo "--Start Uninstall old Garoon ..."
if [ -e /usr/local/cybozu/cbgrn/uninstall_cbgrn ]; then
  sh /usr/local/cybozu/cbgrn/uninstall_cbgrn complete
fi

if [ -e /usr/local/cybozu/mysql-5.0/uninstall_cyde_5_0 ]; then
  sh /usr/local/cybozu/mysql-5.0/uninstall_cyde_5_0 complete
fi
rm -rf /usr/local/cybozu/cbgrn
rm -rf /usr/local/apache2/htdocs/cbgrn
rm -rf /usr/local/cybozu/mysql-5.0
rm -rf /usr/local/cybozu/files
rm -rf /usr/local/cybozu
rm -f /etc/init.d/cyde_5_0
rm -f /etc/init.d/cyss_cbgrn
#pkill -9 mysql
echo "--End Uninstall old Garoon."

# install new Garoon
ARCHIVE_NAME=$(find archive -name ${GAROON_LARGESCALE_PARTTERN} | sort | tail -n1)
cd archive
tar xzvf $(basename ${ARCHIVE_NAME})
cp -rf ../largescale/setting.ini installer
cd installer
sudo sh install.sh mysql64 setting.ini
sudo sh install.sh garoon64 setting.ini
/usr/local/cybozu/cbgrn/grn.cgi -Cq /usr/local/cybozu/cbgrn/code/command/grn_initialize.csp db_admin_password='cybozu' db_user_password='cybozu' garoon_admin_password='cybozu' default_timezone='Asia/Tokyo' default_locale='en' force_initialize='yes' init_data='0'

# start Apache
service httpd restart
cd /usr/local/cybozu/cbgrn
ls -l

/etc/init.d/cyde_5_0 restart

echo "----------------------------End install Garoon Largescale ${GAROON_VERSION}"
