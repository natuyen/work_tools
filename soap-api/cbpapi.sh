XmlFile=$1
ApiUrl=http://localhost:18083/cgi-bin/cbgrn/grn.cgi/cbpapi/schedule/api
curl -H "Content-Type: application/soap+xml; charset=utf-8;" -d "@${XmlFile}" -X POST "${ApiUrl}"