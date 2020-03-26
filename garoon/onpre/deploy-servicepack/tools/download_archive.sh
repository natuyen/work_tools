#!/bin/bash
source install.conf
source build.conf
echo "------Downloading ${ARCHIVE_PATH} ..."
BRANCH=$1                    #4.10.x or 4.10.x/yyyymmdd-HHmm
ARCHIVE_NAME_PARTERN=$2      #grn-*.bin

ALIAS_DEV_RC_FOLDER=/home/file-dev-rc   #alias for //file.dev.cybozu.co.jp/Share/ARCHIVE/RC
ALIAS_BRANCH_FOLDER=${ALIAS_DEV_RC_FOLDER}/${PRODUCT_NAME}/${BRANCH}
ARCHIVE_FOLDER=archive       #~/4.10.x/auto-install/archive

mkdir -p ${ALIAS_DEV_RC_FOLDER}
if ! mountpoint -q "${ALIAS_DEV_RC_FOLDER}"; then
    mount -r -t cifs -o ${FILE_SERVER_AUTH} ${FILE_SERVER_PATH} ${ALIAS_DEV_RC_FOLDER}
fi

ARCHIVE_PATH=$(find ${ALIAS_BRANCH_FOLDER} -name ${ARCHIVE_NAME_PARTERN} | sort | tail -n1)

echo ${ARCHIVE_PATH} >> ${DEPLOY_LOG}
mkdir -p ${ARCHIVE_FOLDER}
cp -rf ${ARCHIVE_PATH} ${ARCHIVE_FOLDER}
umount ${ALIAS_DEV_RC_FOLDER}
echo "Finished."


