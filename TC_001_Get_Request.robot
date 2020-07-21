*** Settings ***
Library  RequestsLibrary


*** Variables ***
${Base_URL}  http://thetestingworldapi.com/


*** Test Cases ***
TC_001_Get_Requests
    create session  Get_Student_Detail  ${Base_URL}
    ${response}=    get request  Get_Student_Detail  /api/studentsDetails
    log to console  ${response.status_code}
    log to console  ${response.content}
