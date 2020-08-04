#!/bin/sh
#source garoon/build_sp/build_sp.conf
DIFF_FILE_LIST_STATUS=${WORKSPACE}/build/diff_file_list_status.txt
FORCE_GET_FILE_LIST=${WORKSPACE}/build/force_get_file_list.txt
FORCE_REMOVE_FILE_LIST=${WORKSPACE}/build/force_remove_file_list.txt

GAROON_DIFF_BRANCH=$1
echo "------------Start export diff source"
echo "GAROON_DIFF_BRANCH  : ${GAROON_DIFF_BRANCH}"
echo "FORCE_GET_FILE_LIST : ${FORCE_GET_FILE_LIST}"
echo "DIFF_FILE_LIST_STATUS : ${DIFF_FILE_LIST_STATUS}"

cd ${WORKSPACE}
cd garoon
git diff --name-status origin/${GAROON_DIFF_BRANCH} | grep -v "build/" | grep -v "build_sp/" | grep -v "build_patch/"| grep -v "tools/" | grep -v "tests/" > ${DIFF_FILE_LIST_STATUS}

echo "-----Adding force get file list"
if [ -f "${FORCE_GET_FILE_LIST}" ]; then
    cat ${FORCE_GET_FILE_LIST} | while read line
    do
        echo -e "M\t${line}" >> ${DIFF_FILE_LIST_STATUS}
    done
fi
echo "-----End adding force get file list"

cat ${DIFF_FILE_LIST_STATUS} | while read line
do
    type=`echo ${line} | cut -d" " -f1`
    file_path=`echo ${line} | cut -d" " -f2`
    directory_path=${file_path%/*}

    # copy file
    if [ -f "${WORKSPACE}/garoon/${file_path}" ]; then
        # make folder
        if [ ! -d "${WORKSPACE}/${directory_path}" ]; then
            mkdir -p "${WORKSPACE}/${directory_path}"
        fi
        cp -vf "${WORKSPACE}/garoon/${file_path}" "${WORKSPACE}/${directory_path}"
    fi
done

echo "-----Adding force remove file list"
if [ -f "${FORCE_REMOVE_FILE_LIST}" ]; then
    cat ${FORCE_REMOVE_FILE_LIST} | while read line
    do
        echo -e "D\t${line}" >> ${DIFF_FILE_LIST_STATUS}
    done
fi
echo "-----End adding force remove file list"

#cp -rf ${DIFF_FILE_LIST_STATUS} ${WORKSPACE}/build/diff_file_list_status.txt

# remove redundant folder
rm -rf ${WORKSPACE}/build_sp

echo "------------End export diff source."
