# create_favours_v2.csp
This tool to create a lot of favour(Like) data
- ./grn.cgi -Cq code/command/create_favours_v2.csp code/command/bulletin_body.json
**bulletin_body.json sample**
```
{
  "module":"grn.bulletin",
  "type": "bulletin_body",
  "topicId":"2",
  "beginUserId":"1",
  "quantityUser":"35"
}
```
- **beginUserId** : user id of the first user
- **quantityUser** : quantity of user need to create