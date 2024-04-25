#!/bin/sh
echo "------------------------------------------------------------------------------------------------"
XmlFile=$1
ApiUrl=http://localhost:18083/cgi-bin/cbgrn/grn.cgi/cbpapi/schedule/api
sed -e 's/%USER_NAME%/Administrator/g' ${XmlFile} > XML_REPLACE.xml
curl -H "Content-Type: application/soap+xml; charset=utf-8;" -d "@XML_REPLACE.xml" -X POST "${ApiUrl}"