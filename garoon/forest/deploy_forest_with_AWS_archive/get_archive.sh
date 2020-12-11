#!/bin/bash
ARCHIVE_LIST=$1
BRANCH=$2
PATTERN=$3
archives=($(grep -oP '(?<=Key>)[^<]+' "${ARCHIVE_LIST}"))

ARCHIVE_LIST_FILTER=archive_list_filter.txt
for i in ${!archives[*]}
do
  echo "${archives[$i]}" >> ${ARCHIVE_LIST_FILTER}
done

#cat archive_list_filter.txt | grep -E "F20.11-2020-12-10-with-e2e".*"-GRF" | sort | tail -n1
ARCHIVE_PATH=$(cat ${ARCHIVE_LIST_FILTER} | grep -E "${BRANCH}".*"${PATTERN}" | sort | tail -n1)
echo "${ARCHIVE_PATH}"
