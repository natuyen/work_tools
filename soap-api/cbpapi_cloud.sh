#!/bin/sh
echo "------------------------------------------------------------------------------------------------"
XmlFile=$1
ApiUrl=https://tuyennguyen-dev.cybozu-dev.com/g/cbpapi/schedule/api.csp
sed -e 's/%USER_NAME%/cybozu/g' ${XmlFile} > XML_REQUEST.xml
curl -H "Content-Type: application/soap+xml; charset=utf-8;" -d "@XML_REQUEST.xml" -X POST "${ApiUrl}"