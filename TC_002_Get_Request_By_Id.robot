*** Settings ***
Library  RequestsLibrary


*** Variables ***
${Application_Base_Url}  http://thetestingworldapi.com/
${Student_Id}  28

*** Test Cases ***
TC_002_Fetch_Details_By_ID
    create session  FetchData  ${Application_Base_Url}
    ${response}=  get request  FetchData  api/studentsDetails/${Student_Id}
    ${actual_status_code}  convert to string  ${response.status_code}
    log to console  ${response.status_code}
    log to console  ${response.content}
    should be equal  ${actual_status_code}  200
