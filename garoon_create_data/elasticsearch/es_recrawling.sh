#!/bin/sh
command=$1
SS_NAME=tuyennguyen-dev
WORKER_HOST=$SS_NAME-ap
echo WORKER_HOST=$WORKER_HOST
DOMAIN_ID=$(domaindb id $SS_NAME.cybozu-dev.com)
echo DOMAIN_ID=$DOMAIN_ID

if [ $command = "delete" ]; then
  echo ------------------------Delete index
  curl -XPOST -vL -H "X-CYDEC-DOMAIN: $DOMAIN_ID" "http://${WORKER_HOST}:8080/g/batch/elasticsearch/index/delete"

  echo ------------------------Crawling start
  curl -XPOST -vL -H "X-CYDEC-DOMAIN: $DOMAIN_ID" "http://${WORKER_HOST}:8080/g/batch/elasticsearch/crawling/start" | jq
fi

echo ------------------------Crawling status
curl -XPOST -vL -H "X-CYDEC-DOMAIN: $DOMAIN_ID" "http://${WORKER_HOST}:8080/g/batch/elasticsearch/crawling/status" | jq