#!/bin/bash
ARCHIVE_LIST=$1
archives=($(grep -oP '(?<=Key>)[^<]+' "${ARCHIVE_LIST}"))

ARCHIVE_LIST_FILTER=archive_list_filter.txt
for i in ${!archives[*]}
do
  echo "${archives[$i]}" >> ${ARCHIVE_LIST_FILTER}
done


