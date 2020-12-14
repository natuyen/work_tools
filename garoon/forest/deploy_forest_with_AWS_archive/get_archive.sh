#!/bin/bash
#ARCHIVE_LIST=$1
BRANCH=$1

# get lastest folder
ARCHIVE_FOLDER_LIST_URL="https://cybozu-garoon-ci.s3.ap-northeast-1.amazonaws.com/?list-type=2&delimiter=%2F&prefix=archives%2F${BRANCH}%2F"
ARCHIVE_FOLDER_LIST=archive_folder_list.txt
curl -o ${ARCHIVE_FOLDER_LIST} "${ARCHIVE_FOLDER_LIST_URL}"
ARCHIVE_FOLDER_LASTEST=$(cat ${ARCHIVE_FOLDER_LIST} | grep -"<Prefix>" | sort | tail -n1)
echo "${ARCHIVE_FOLDER_LASTEST}"


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
