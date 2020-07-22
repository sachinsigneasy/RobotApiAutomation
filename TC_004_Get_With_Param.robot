*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections

*** Variables ***
${Application_Base_Url}   https://reqres.in

*** Test Cases ***
TC_004_Validate_Get_With_Params
    create session  GetParam    ${Application_Base_Url}
    &{param}=   create dictionary  page=2
    ${response}=    get request     GetParam   /api/users   params=${param}
    ${statuscode}=  convert to string  ${response.status_code}
    should be equal  ${statuscode}     200
    log to console  ${response.content}

    ${json_res}=   to json  ${response.content}

    @{email_list}=  get value from json    ${json_res}    data[2].email
    ${email}=  get from list  ${email_list}  0
    log to console  ${email}
    should be equal     ${email}   tobias.funke@reqres.in


