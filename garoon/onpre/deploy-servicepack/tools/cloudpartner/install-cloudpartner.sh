#!/bin/bash -e
source install.conf
GAROON_VERSION=$1
echo "----------------------------Starting install Garoon Cloud Partner ${GAROON_VERSION}..."
# download single archive
bash -ex download_archive.sh ${GAROON_VERSION} ${GAROON_SINGLE_PARTTERN}
bash -ex download_archive.sh ${GAROON_VERSION} ${GAROON_CLOUDPARTNER_PARTTERN}

# uninstall old Garoon
echo "--Start Uninstall old Garoon ..."
if [ -f /etc/init.d/cyde_5_0_cbgrn_1 ]; then
    /etc/init.d/cyde_5_0_cbgrn_1 stop
fi
if [ -f /etc/init.d/cyssp_cbgrn_1 ]; then
    /etc/init.d/cyssp_cbgrn_1 restart
    /etc/init.d/cyssp_cbgrn_1 stop
fi
rm -rf /var/www/cgi-bin/cbgrn
rm -rf /var/www/html/cbgrn
rm -rf /usr/local/cybozu
rm -f /etc/init.d/cyde_5_0_cbgrn_1
rm -f /etc/init.d/cyssp_cbgrn_1
echo "--End Uninstall old Garoon."

# install new Garoon
cd archive
SINGLE_ARCHIVE_NAME=$(find . -name ${GAROON_SINGLE_PARTTERN} | sort | tail -n1)
cp -rf ../cloudpartner/config .
sh ${SINGLE_ARCHIVE_NAME} config

CLOUDPARTNER_ARCHIVE_NAME=$(find . -name ${GAROON_CLOUDPARTNER_PARTTERN} | sort | tail -n1)
tar zxf ${CLOUDPARTNER_ARCHIVE_NAME}
cd grn-cloud-${GAROON_VERSION}
tar zxf garoon-${GAROON_VERSION}.tar.gz
cd install
chown -R apache:root ./code
cp -arf ./code /var/www/cgi-bin/cbgrn

# initialize Garoon
cd /var/www/cgi-bin/cbgrn
sudo ./grn.cgi -C -q code/command/grn_initialize.csp db_admin_password=cybozu db_user_password=cybozu garoon_admin_password=cybozu default_timezone=Asia/Tokyo default_locale=ja force_initialize='yes' init_data='0'

sed -i "s/^on_saas.*/on_saas=1/" /var/www/cgi-bin/cbgrn/common.ini
sed -i "s/^\[Global\]/\[Global\]\ndebug=1/" /var/www/cgi-bin/cbgrn/common.ini
./grn.cgi -Cq code/command/create_saas_manager.csp
./grn.cgi -Cq code/command/license_saas_manager.csp user=100

# start Apache
service httpd restart
cd /var/www/cgi-bin/cbgrn
ls -l
/etc/init.d/cyde_5_0_cbgrn_1 restart

echo "----------------------------End install Garoon Cloud Partner ${GAROON_VERSION}"
