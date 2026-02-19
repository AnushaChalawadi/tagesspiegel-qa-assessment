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

Close Test Browser
    [Documentation]    Closes all browser instances opened during the test
    Close Browser    ALL

