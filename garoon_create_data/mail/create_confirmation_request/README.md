# create_mail_confirmation.csp is used to create huge data mail with confirmation request and confirmation response

## How to use
- Copy tool to "cbgrn/code/command" folder 
- cd "cbgrn" folder
- Run: ./grn.cgi -Cq code/command/create_mail_confirmation.csp total_mail=1000 total_confirmation=1000
<br/>
- If no input params then
    - total_mail: default is 1000
  - total_confirmation: default is 1000

## Output
- Quantify of mail = quantify of user * total_mail * 4 
- Quantify of correct confirmation request and respone = Quantify of mail
- Quantify of WRONG confirmation request and respone = quantify of user * total_confirmation * 2