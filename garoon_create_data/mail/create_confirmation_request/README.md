# create_mail_confirmation.csp

## Overview
- It is used to create huge data mail (in <b>Inbox, Sent items</b> folders) with confirmation request and confirmation response
- It will dump data in tables
    - tab_grn_mail_message_pxx
    - tab_grn_mail_confirmationrequest
    - tab_grn_mail_confirmationresponse   

## How to use
- You can use the following csv files to create users and mail account.
    - https://github.dev.cybozu.co.jp/tuyen-nguyen/work_tools/blob/master/garoon_create_data/mail/user_1_100.csv 
    - https://github.dev.cybozu.co.jp/tuyen-nguyen/work_tools/blob/master/garoon_create_data/mail/email_1_100.csv
- Copy tool to "cbgrn/code/command" folder 
- cd "cbgrn" folder
- Run: 
    - ./grn.cgi -Cq code/command/create_mail_confirmation.csp max_count=1000

- <b>max_count</b>
    - If no input param then default loop number is 1000
    - Every loop will create
        - 4 mail for every user
        - 4 correct confimration request + confirmation response for every user
        - 2 redundant confimration request + confirmation response for every user

## Example:
- max_count = 1000, every user will create
    - 4 * 1000 mail
    - 6 * 1000 confirmation ( request + response )
- In Garoon, we will have
    - quantify of user * total_mail * 4 mails = 400.000 mails
    - quantify of user * total_mail * 4 correct confirmation ( request + response ) = 400.000 confirmation
    - quantify of user * total_confirmation * 2 redundant confirmation ( request + response ) = 200.000 redundant confirmation
