*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Resource  Resources/UserDefinedKeyword.robot

*** Variables ***


*** Test Cases ***
TC_001_Fetch_and_validate_status_code_and_return
    Fetch Details and Validate status code  55187   200
    ${response}=    fetch and return get response  55187
    log to console  ${response.status_code}
    log to console  ${response.content}

