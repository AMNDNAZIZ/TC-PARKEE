*** Settings ***
Resource    ../api/List_API.robot

*** Keywords ***

Register User with Data Driven Test
    [Arguments]    ${Test Type}    ${Base_URL}    ${Endpoint}    ${Email}    ${Password}    ${Response_Status}    ${Response_Error}
    Create Session    mysession   ${Base_URL}    
    IF  '${Test Type}' == 'Positive'
        ${Body Request}=    Create Dictionary    email=${Email}    password=${Password}    
        ${Response}=    POST On Session    mysession    ${Endpoint}    data=${Body Request}
        Log To Console    ${Response}
        # Validasi Response = 200
        Status Should Be    ${Response_Status}    ${Response} 
        # Validasi Response Data sama dengan Request
        ${Token}=    Get Value From Json    ${Response.json()}    token
        Should Not Be Empty    ${Token}
    ELSE IF    '${Test Type}' == 'Negative'
        ${Body Request}=    Create Dictionary    email=${Email}    password=${Password}
        ${Response}=    POST On Session    mysession    ${Endpoint}    data=${Body Request}    expected_status=${Response_Status}  
        #Validasi Response = 400
        Status Should Be    ${Response_Status}    ${Response}
        #Validasi Error Message
        ${error}=    Get Value From Json    ${Response.json()}    error
        ${errorFromList}=    Get From List   ${error}    0
        ${errorAsString}=    Convert To String    ${errorFromList}
        Should Be Equal As Strings    ${errorAsString}    ${Response_Error}
    END
    
    