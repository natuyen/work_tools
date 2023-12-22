# create_mail_confirmation.csp

## Overview
- It is used to create huge data mail with confirmation request and confirmation response
- It will dump data in tables
    - tab_grn_mail_message_pxx
    - tab_grn_mail_confirmationrequest
    - tab_grn_mail_confirmationresponse   

## How to use
- Copy tool to "cbgrn/code/command" folder 
- cd "cbgrn" folder
- Run: 
    - ./grn.cgi -Cq code/command/create_mail_confirmation.csp total_mail=1000 total_confirmation=1000

- If no input params then
    - total_mail: quantity of mail of every user, default is 1000
    - total_confirmation: quantity of redudant confirmation request, response of every user, default is 1000

## Example:
- total_mail = 1000, every user will create
    - 4 * 1000 mail
    - 4 * 1000 confirmation ( request + response )
- total_confirmation = 1000
    - 1000 redundant confirmation request
    - 1000 redundant confirmation response
- In Garoon, we will have
    - quantify of user * total_mail * 4 mails
    - quantify of user * total_mail * 4 correct confirmation ( request + response )
    - quantify of user * total_confirmation * 2 redundant confirmation ( request + response )
