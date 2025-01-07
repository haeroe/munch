*** Settings ***
Resource        backend.resource
Suite Setup     Wait For Endpoint


*** Variables ***
${ENDPOINT}=    ${HOST}/ingredient


*** Test Cases ***
Backend Provides List of Ingredients
    ${resp}=    GET     ${ENDPOINT}
    Response JSON Should Fit List   ${resp}
    Run Keyword and Expect Error    *
      ...                           Response JSON Should Fit Dictionary
      ...                               ${resp}

Backend Provides Valid Ingredients
    ${resp}=    GET     ${ENDPOINT}
    ${ingredient}=      Set Variable    ${resp.json()[0]}
    Dictionary Should Contain Key   ${ingredient}                   name
    Dictionary Should Contain Key   ${ingredient}                   per
    Dictionary Should Contain Key   ${ingredient}                   as_volume
    Dictionary Should Contain Key   ${ingredient}                   nutrients
    Dictionary Should Contain Key   ${ingredient['nutrients']}      calories
    Dictionary Should Contain Key   ${ingredient['nutrients']}      protein
    Dictionary Should Contain Key   ${ingredient['nutrients']}      carbohydrates
    Dictionary Should Contain Key   ${ingredient['nutrients']}      fat
    Dictionary Should Contain Key   ${ingredient['nutrients']}      fibre


*** Keywords ***
Response JSON Should Fit List
    [Arguments]     ${resp}
    @{list}=        Set Variable    ${resp.json()}

Response JSON Should Fit Dictionary
    [Arguments]     ${resp}
    &{list}=        Set Variable    ${resp.json()}

Wait For Endpoint
    Wait Until Keyword Succeeds     60s     1s
      ...   GET     ${ENDPOINT}
