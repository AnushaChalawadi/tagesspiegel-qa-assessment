*** Settings ***
Library     SeleniumLibrary
Resource    HomePage.robot
Variables    ../variables/environments.yaml
Variables    ../variables/common_variables.yaml

*** Keywords ***
Open Tagesspiegel Application
    [Documentation]    This keyword opens the Tagesspiegel application in a web browser 
    ...    and maximizes the window. It also accepts cookies if the banner is present
    ${BASE_URL}    Set Variable    ${environments}[${ENV}][base_url]
    Log To Console    Running tests on ${ENV} environment
    Open Browser    ${BASE_URL}    ${BROWSER}   
    Maximize Browser Window
    Accept Cookies If Present

Close Browser
    [Documentation]    This keyword closes the web browser opened during the test
    Close All Browsers
