*** Settings ***
Library      Browser
Resource     HomePage.robot
Variables    ../variables/environments.yaml
Variables    ../variables/common_variables.yaml

*** Keywords ***

Open Tagesspiegel Application
    [Documentation]    This keyword opens the tagesspiegel.de homepage 
    ...    using the BASE_URL variable
    New Browser    chromium    headless=${FALSE}
    ${BASE_URL}=    Set Variable    ${environments}[${ENV}][base_url]
    New Page    ${BASE_URL}
    Wait For Elements State    body    visible    timeout=15s
    Accept Cookies If Present

Close Browser
    [Documentation]    This keyword closes the current page and browser
    Close Page    ${PAGE}
    Close Browser

