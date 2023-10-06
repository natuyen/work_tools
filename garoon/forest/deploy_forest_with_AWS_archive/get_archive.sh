#!/bin/bash -eu
BRANCH=$1
AWS_URL="https://cybozu-garoon-ci.s3-ap-northeast-1.amazonaws.com"

# read AWS archives url https://cybozu-garoon-ci.s3-ap-northeast-1.amazonaws.com/index.html#archives/
ARCHIVE_FOLDER_LIST_URL="${AWS_URL}/?list-type=2&delimiter=%2F&prefix=archives%2F${BRANCH}%2F"
ARCHIVE_FOLDER_LIST_XML=archive_folder_list_xml.txt
curl -o ${ARCHIVE_FOLDER_LIST_XML} "${ARCHIVE_FOLDER_LIST_URL}"

# get KeyCount
keycount=($(grep -oP '(?<=KeyCount>)[^<]+' "${ARCHIVE_FOLDER_LIST_XML}"))
# KeyCount = 0 : no archive in AWS branch, ex: index.html#archives/F23.5 no exist
# use index.html#latest-archives/${BRANCH}/
if [ $keycount -eq 0 ]; then
    ARCHIVE_FOLDER_LASTEST_PATH="${AWS_URL}/index.html#latest-archives/${BRANCH}/"
else # use index.html#archives/ url
    # get laster archive folder
    if [ "${ARCHIVE_FOLDER}" == "" ]; then
        archives_folder_list=($(grep -oP '(?<=Prefix>)[^<]+' "${ARCHIVE_FOLDER_LIST_XML}"))
        archives_folder_latest=${archives_folder_list[-1]}
        ARCHIVE_FOLDER_LASTEST_PATH="${AWS_URL}/index.html#${archives_folder_latest}"
#        for i in ${!archives_build_array[*]}
#        do
#            archive_build_date=${archives_build_array[$i]}
#            ARCHIVE_FOLDER_LASTEST_PATH="{AWS_URL}/index.html#archives/${BRANCH}/${archive_build_date}"
#        done
    else # get specific archive folder
        ARCHIVE_FOLDER_LASTEST_PATH="${AWS_URL}/index.html#archives/${BRANCH}/${ARCHIVE_FOLDER}/"
    fi
fi

echo ARCHIVE_FOLDER_LASTEST_PATH: "$ARCHIVE_FOLDER_LASTEST_PATH"

# get archive garoon
#ARCHIVE_FOLDER_LASTEST_URL="https://cybozu-garoon-ci.s3.ap-northeast-1.amazonaws.com/?list-type=2&delimiter=%2F&prefix=${ARCHIVE_FOLDER_LASTEST_PATH}"
ARCHIVE_LIST=archive_list.txt
curl -o ${ARCHIVE_LIST} "${ARCHIVE_FOLDER_LASTEST_PATH}"
ARCHIVE_GAROON=
archives=($(grep -oP '(?<=Key>)[^<]+' "${ARCHIVE_LIST}" | grep 'garoon-GRF'))
for i in ${!archives[*]}
do
   ARCHIVE_GAROON="${archives[$i]}"
done
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
