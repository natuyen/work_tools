#!/bin/bash
archives=($(grep -oP '(?<=Key>)[^<]+' "archive_list.txt"))

for i in ${!archives[*]}
do
  echo "$i" "${archives[$i]}"
done
