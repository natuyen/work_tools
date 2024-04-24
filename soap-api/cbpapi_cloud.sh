XmlFile=$1
ApiUrl=https://tuyennguyen-dev.cybozu-dev.com/g/cbpapi/schedule/api.csp
curl -H "Content-Type: application/soap+xml; charset=utf-8;" -d "@${XmlFile}" -X POST "${ApiUrl}"