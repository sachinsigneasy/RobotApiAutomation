*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Application_Base_Url}     http://thetestingworldapi.com
${original_first_name}  Sachin
${updated_first_name}   Sameer

*** Test Cases ***
TC_007_E2E_Request_Chaining
    create session  E2E    ${Application_Base_Url}
    &{body}=    create dictionary  first_name=${original_first_name}    middle_name=S  last_name=patel    date_of_birth=12/12/1998
    &{header}=  create dictionary  Content-Type=application/json
    ${post_response}=    post request    E2E      /api/studentsDetails    data=${body}  headers=${header}
    log to console  ${post_response.status_code}
    ${json_response}=   to json   ${post_response.content}
    @{id_list}=     get value from json     ${json_response}    id
    ${id}=  get from list  ${id_list}   0

    &{body1}=    create dictionary  id=${id}     first_name=${updated_first_name}    middle_name=S  last_name=patel    date_of_birth=12/12/1998
    ${put_response}=    put request  E2E    /api/studentsDetails/${id}  data=${body1}    headers=${header}
    log to console  ${put_response.status_code}
    log to console  ${put_response.content}

    ${get_reponse}=  get request  E2E    /api/studentsDetails/${id}
    ${get_json_response}=   to json  ${get_reponse.content}
    @{first_name_list}=     get value from json  ${get_json_response}   data.first_name
    ${first_name}=  get from list  ${first_name_list}   0
    should be equal     ${first_name}   ${updated_first_name}

    ${delete_response}=   delete request    E2E     /api/studentsDetails/${id}
    ${json_delete}=     to json  ${delete_response.content}
    @{message}=     get value from json  ${json_delete}  status
    ${statusm}=     get from list  ${message}   0
    should be equal  ${statusm}     true
