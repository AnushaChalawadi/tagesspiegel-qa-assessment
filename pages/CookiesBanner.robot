*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${COOKIE_IFRAME}      xpath=//iframe[contains(@id,'sp_message_iframe')]
${ACCEPT_BUTTON}      xpath=//button[contains(.,'Alle akzeptieren')]

*** Keywords ***
Accept Cookies If Present
    ${iframe_exists}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${COOKIE_IFRAME}

    IF    ${iframe_exists}
        Select Frame    ${COOKIE_IFRAME}
        Wait Until Element Is Visible    ${ACCEPT_BUTTON}    10s
        Click Element    ${ACCEPT_BUTTON}
        Unselect Frame
        Wait Until Page Does Not Contain Element    ${COOKIE_IFRAME}    10s

    END
