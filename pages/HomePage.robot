*** Settings ***
Library     SeleniumLibrary
Library     String
Variables   ../variables/common_variables.robot 

*** Variables ***
${ANMELDEN_LINK}       xpath=//a[@data-gtm-link-text='Anmelden']
${MODAL_IFRAME}        id=modal-iframe
${COOKIE_IFRAME}       xpath=//iframe[contains(@id,'sp_message_iframe')]
${ACCEPT_BUTTON}       xpath=//button[contains(.,'Alle akzeptieren')]

*** Keywords ***
Click Anmelden Modal
    [Documentation]    Click on the Anmelden link and wait for the login modal to appear
    Wait Until Element Is Visible    ${ANMELDEN_LINK}    ${WAIT_TIME_10SEC}
    Click Element    ${ANMELDEN_LINK}
    Wait Until Element Is Visible    ${MODAL_IFRAME}    ${WAIT_TIME_10SEC}

Accept Cookies If Present
    [Documentation]    Accepts cookies if the cookie banner is present on the page
    ${iframe_exists}=    Run Keyword And Return Status
    ...    Element Should Be Visible    ${COOKIE_IFRAME}

    IF    ${iframe_exists}
        Select Frame    ${COOKIE_IFRAME}
        Wait Until Element Is Visible    ${ACCEPT_BUTTON}    ${WAIT_TIME_10SEC}
        Click Element    ${ACCEPT_BUTTON}
        Unselect Frame
        Wait Until Page Does Not Contain Element    ${COOKIE_IFRAME}    ${WAIT_TIME_10SEC}

    END



    