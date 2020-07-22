*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Applicaion_Base_Url}    http://thetestingworldapi.com/
${Student_id}   1

*** Test Cases ***
TC_003_Get_request_validate_content_using_json
    create session  Get_Request_Validate_Content    ${Applicaion_Base_Url}
    ${Response}=    get request  Get_Request_Validate_Content   api/studentsDetails/${Student_Id}
    log to console  ${Response.status_code}
    ${actual_status_code}=  convert to string  ${Response.status_code}
    should be equal  ${actual_status_code}    200
    log to console  ${Response.content}

    ${json_res}=    to json  ${Response.content}

    @{first_name_list}=  get value from json    ${json_res}    data.first_name
    ${first_name}=  get from list  ${first_name_list}  0
    log to console   ${first_name}
    should be equal  ${first_name}   sample string 2

    @{last_name_list}=  get value from json    ${json_res}    data.last_name
    ${last_name}=  get from list  ${last_name_list}  0
    log to console   ${last_name}
    should be equal  ${last_name}   sample string 4