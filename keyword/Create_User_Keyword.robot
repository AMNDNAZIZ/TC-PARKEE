*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    ../api/List_API.robot


*** Keywords ***

Create User with Data Driven Test
    [Arguments]    ${Base_URL}    ${Endpoint}    ${Nama}    ${JOB}    ${Response_Status}    ${Response_body}
    Create Session    mysession   ${Base_URL}    
    ${Body Request}=    Create Dictionary    name=${Nama}    job=${JOB}
    ${Response}=    POST On Session    mysession    ${Endpoint}    data=${Body Request}
# Validasi Response = 201
    Status Should Be    ${Response_Status}    ${Response} 
# Validasi Response Data sama dengan Request
    ${name}=    Get Value From Json    ${Response.json()}    name
    ${nameFromList}=    Get From List   ${name}    0
    ${nameAsString}=    Convert To String    ${nameFromList}
    Should Be Equal As Strings    ${nameAsString}    ${Response_body}
