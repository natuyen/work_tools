#!/bin/bash -e
source install.conf
SP_VERSION=$1
GAROON_SP_BRANCH=$2
SP_CLOUDPARTNER_PARTTERN=grn-cloud-${SP_VERSION}.tar.gz
echo "------Starting install Cloud Partner Service Pack : ${SP_VERSION} - Branch: ${GAROON_SP_BRANCH}"
# download single sp archive
TODAY=$(TZ=":Asia/Bangkok" date +"%Y%m%d")
SP_BRANCH_FOLDER=${TODAY}*
if [ "${GAROON_SP_BRANCH}" != ${SP_VERSION} ]; then
    SP_BRANCH_FOLDER=${GAROON_SP_BRANCH}
fi
bash -ex download_archive.sh ${SP_VERSION}/${SP_BRANCH_FOLDER} ${SP_CLOUDPARTNER_PARTTERN}

# install new Service Pack
cd archive
ARCHIVE_NAME=$(find . -name ${SP_CLOUDPARTNER_PARTTERN} | sort | tail -n1)
tar xzvf ${ARCHIVE_NAME}
#cp -rf ../cloudpartner/config grn-cloud-${SP_VERSION}
cd grn-cloud-${SP_VERSION}
sh install.sh config



# start Apache
service httpd restart

/etc/init.d/cyssp_cbgrn_1 restart

echo "------End install Cloud Partner Service Pack ${SP_VERSION}"

