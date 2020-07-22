*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Applicaion_Base_Url}  http://thetestingworldapi.com/
${Student_id}  1

*** Test Cases ***
TC_003_Get_request_validate_content_using_json
    create session  Get_Request_Validate_Content    ${Applicaion_Base_Url}
    ${Response}=    get request  Get_Request_Validate_Content   api/studentsDetails/${Student_Id}
    log to console  ${Response.status_code}
    ${actual_status_code}=  convert to string  ${Response.status_code}
    should be equal  ${actual_status_code}    200
    log to console  ${Response.content}
    ${json_res}=    to json  ${Response.content}
    @{first_name_list}=  get value from json  ${json_res}    data.first_name
    ${firsy_name}=  get from list  ${first_name_list}   0
    log to console  ${firsy_name}


