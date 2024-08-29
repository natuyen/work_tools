#!/bin/sh
echo "------------------------------------------------------------------------------------------------"
XmlFile=$1
source config.ini
ApiUrl=${URL_ONPRE}/cbpapi/${MODULE}/api
echo "Api Url: ${ApiUrl}"
echo "XmlFile: ${XmlFile}"
echo "Response:"
sed -e "s/%USER_NAME%/${USER_NAME}/g" -e "s/%PASSWORD%/${PASSWORD}/g" ${XmlFile} > XML_REQUEST.xml
curl -H "Content-Type: application/soap+xml; charset=utf-8;" -d "@XML_REQUEST.xml" -X POST "${ApiUrl}"
