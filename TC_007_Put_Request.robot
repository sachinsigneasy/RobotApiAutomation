*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Application_Url}  http://thetestingworldapi.com
${Student_ID}   55008

*** Test Cases ***
TC_007_Put_Request
    create session  Put_Request     ${Application_Url}
    &{body}=    create dictionary  id=55008  first_name=sachin
    &{header}=  create dictionary   Content-Type=application/json
    ${response}=    put request  Put_Request    /api/studentsDetails/${Student_ID}  data=${body}    headers=${header}
    ${code}=    convert to string  ${response.status_code}
    should be equal  ${code}    200
    log to console     ${response.status_code}
    log to console      ${response.content}
    ${response1}=    get request  Put_Request    /api/studentsDetails/${Student_ID}
    log to console  ${response1.content}


