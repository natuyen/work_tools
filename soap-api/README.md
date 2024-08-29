# cbpapi_cloud.sh
It is used to run SOAP API on Cloud

## Prepare XML file
- Using SOAP API test tool to run a SOAP API successfully 
  - http://soapapi-test.dev.cybozu.xyz/
- Copy "Request" source and save to xml file. Example: **ScheduleAddFollowsToRepeatEvent.xml** 

## Run tool
### Setting config.ini
  - **URL_CLOUD**=https://tuyennguyen-dev.cybozu-dev.com
  - **MODULE**=schedule
  - If want to set user name and password automatically, we need to set **USER_NAME** and **PASSWORD** setting
    - Example:
      - USER_NAME=cybozu (optional)
      - PASSWORD=cybozu (optional)
    - In XML file, we need to set variable
    ```
        <UsernameToken wsu:Id="id">
            <Username>%USER_NAME%</Username>
            <Password>%PASSWORD%</Password>
        </UsernameToken>
    ```

### Run:
It is run on local machine
- ./cbpapi_cloud.sh ScheduleAddFollowsToRepeatEvent.xml 
