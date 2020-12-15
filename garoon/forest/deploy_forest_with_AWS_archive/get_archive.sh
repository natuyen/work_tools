#!/bin/bash
BRANCH=$1
ARCHIVE_FOLDER_LASTEST=${ARCHIVE_FOLDER}
# get lastest folder
if [ "${ARCHIVE_FOLDER_LASTEST}" == "" ]; then
    ARCHIVE_FOLDER_LIST_URL="https://cybozu-garoon-ci.s3.ap-northeast-1.amazonaws.com/?list-type=2&delimiter=%2F&prefix=archives%2F${BRANCH}%2F"
    ARCHIVE_FOLDER_LIST=archive_folder_list.txt
    curl -o ${ARCHIVE_FOLDER_LIST} "${ARCHIVE_FOLDER_LIST_URL}"
    archives=($(grep -oP '(?<=Prefix>)[^<]+' "${ARCHIVE_FOLDER_LIST}"))
    for i in ${!archives[*]}
    do
       ARCHIVE_FOLDER_LASTEST="${archives[$i]}"
    done
    #echo "${ARCHIVE_FOLDER_LASTEST}"
fi

# get archive garoon
ARCHIVE_FOLDER_LASTEST_URL="https://cybozu-garoon-ci.s3.ap-northeast-1.amazonaws.com/?list-type=2&delimiter=%2F&prefix=${ARCHIVE_FOLDER_LASTEST}"
ARCHIVE_LIST=archive_list.txt
curl -o ${ARCHIVE_LIST} "${ARCHIVE_FOLDER_LASTEST_URL}"
ARCHIVE_GAROON=
archives=($(grep -oP '(?<=Key>)[^<]+' "${ARCHIVE_LIST}" | grep 'garoon-GRF'))
for i in ${!archives[*]}
do
   ARCHIVE_GAROON="${archives[$i]}"
done
#echo "ARCHIVE_GAROON=${ARCHIVE_GAROON}" > deploy_variable.conf
echo ${ARCHIVE_GAROON}


#
##cat archive_list_filter.txt | grep -E "F20.11-2020-12-10-with-e2e".*"-GRF" | sort | tail -n1
#ARCHIVE_PATH=$(cat ${ARCHIVE_LIST_FILTER} | grep -E "${BRANCH}".*"${PATTERN}" | sort | tail -n1)
#echo "${ARCHIVE_PATH}"

#PATTERN=$3
#archives=($(grep -oP '(?<=Key>)[^<]+' "${ARCHIVE_LIST}"))
#
#ARCHIVE_LIST_FILTER=archive_list_filter.txt
#for i in ${!archives[*]}
#do
#  echo "${archives[$i]}" >> ${ARCHIVE_LIST_FILTER}
#done
#
##cat archive_list_filter.txt | grep -E "F20.11-2020-12-10-with-e2e".*"-GRF" | sort | tail -n1
#ARCHIVE_PATH=$(cat ${ARCHIVE_LIST_FILTER} | grep -E "${BRANCH}".*"${PATTERN}" | sort | tail -n1)
#echo "${ARCHIVE_PATH}"
