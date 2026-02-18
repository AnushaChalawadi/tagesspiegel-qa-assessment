*** Settings ***
Library     SeleniumLibrary
Resource    CookiesBanner.robot
Variables    ../variables/environments.yaml

*** Variables ***
#${BASE_URL}    https://www.tagesspiegel.de/
${ENV}   PROD

*** Keywords ***
Open Tagesspiegel Application
    [Documentation]    This keyword opens the Tagesspiegel application in a web browser 
    ...    and maximizes the window. It also accepts cookies if the banner is present.
    ${BASE_URL}    Set Variable    ${${ENV}_BASE_URL}
    Open Browser    ${BASE_URL}    Chrome   
    Maximize Browser Window
    Accept Cookies If Present

Close Browser
    [Documentation]    This keyword closes the web browser opened during the test.
    Close All Browsers