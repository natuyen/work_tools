#!/bin/sh
echo "---WORKSPACE  : ${WORKSPACE}"

source garoon/build_patch/build_patch.conf
bash -ex garoon/build_patch/prepare_env.sh
bash garoon/build_patch/export_source.sh ${GAROON_BRANCH_PATCH}

# encode PHP
bash build/encode_php_gr.sh ${WORKSPACE}/source

# package patch
# For single
rm -rf ${SINGLE_ARCHIVE_NAME}
mkdir -p ${SINGLE_ARCHIVE_NAME}
cp -rf source/encoded/code ${SINGLE_ARCHIVE_NAME}
cp -rf source/locale ${SINGLE_ARCHIVE_NAME}

echo "------Make Windows archive"
zip -r ${SINGLE_ARCHIVE_NAME}.zip ${SINGLE_ARCHIVE_NAME}

echo ""
echo "------Make Linux archive"
tar -cvf ${SINGLE_ARCHIVE_NAME}.tar ${SINGLE_ARCHIVE_NAME}

echo ""
echo "------Make Largescale archive"
rm -rf ${LARGESCALE_ARCHIVE_NAME}
mkdir -p ${LARGESCALE_ARCHIVE_NAME}
cp -rf source/code ${LARGESCALE_ARCHIVE_NAME}
cp -rf source/locale ${LARGESCALE_ARCHIVE_NAME}
tar -cvf ${LARGESCALE_ARCHIVE_NAME}.tar ${LARGESCALE_ARCHIVE_NAME}

# store archive
mkdir build/builds
# modified_file_list
cp -rf build/diff_file_list_status.txt build/modified_file_list.txt
sed -i 's/M\t//g' build/modified_file_list.txt;
cp -rf build/modified_file_list.txt build/builds

cp -rf *.zip *.tar build/builds

# copy file to server
FILE_SERVER_RC=//file.dev.cybozu.co.jp/Share/ARCHIVE/RC/garoon
DEV_RC_FOLDER=/home/file-dev-rc
mount -t cifs ${FILE_SERVER_RC} ${DEV_RC_FOLDER} -o guest
TIME_NOW=$(TZ=":Asia/Bangkok" date +"%Y%m%d-%H%M")
PATCH_ARCHIVE_FOLDER=${DEV_RC_FOLDER}/${GAROON_BRANCH_PATCH}-Patch/${SINGLE_ARCHIVE_NAME}/${TIME_NOW}-${BUILD_ID}
mkdir -p ${PATCH_ARCHIVE_FOLDER}
cp -rvf build/builds/* ${PATCH_ARCHIVE_FOLDER}