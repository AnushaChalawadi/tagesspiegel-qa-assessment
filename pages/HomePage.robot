*** Settings ***
Library     Browser
Library     String
Variables   ../variables/common_variables.yaml

*** Variables ***
${ANMELDEN_LINK}       xpath=//a[@data-gtm-link-text='Anmelden']
${MODAL_IFRAME}        id=modal-iframe
#${COOKIE_IFRAME}       xpath=//iframe[contains(@id,'sp_message_iframe')]
${COOKIE_IFRAME}       iframe[id*="sp_message_iframe"]
${COOKIE_ACCEPT_BTN}   ${COOKIE_IFRAME} >>> button.accept-all

*** Keywords ***
Accept Cookies If Present
    [Documentation]    This keyword accepts cookies if the cookie banner is present on the page
    ${iframe_found}=    Run Keyword And Return Status
    ...    Wait For Elements State    ${COOKIE_IFRAME}    visible    timeout=10s
    # click the accept button if the iframe is found
    IF    ${iframe_found}
        Click    ${COOKIE_ACCEPT_BTN}
        Sleep    2s    reason=Wait for cookie popup to close
    END

Click Anmelden Modal
    [Documentation]    Clicks the 'Anmelden' (login) modal in the page header
    Wait For Elements State    ${ANMELDEN_LINK}    visible    timeout=15s
    Click    ${ANMELDEN_LINK}
    

