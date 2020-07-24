*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections


*** Variables ***
${Base_URL}  http://thetestingworldapi.com/


*** Keywords ***
Fetch Details and Validate status code
      [Arguments]  ${id}    ${actual_status_code}
      create session  Get_details   ${Base_URL}
      ${response}=  get request  Get_details  api/studentsDetails/${id}
      ${status_code}=   convert to string   ${response.status_code}
      should be equal  ${actual_status_code}    ${status_code}

Fetch And Return Get Response
      [Arguments]  ${id}
      create session  Get_details   ${Base_URL}
      ${response}=  get request  Get_details  api/studentsDetails/${id}
      [Return]  ${response}